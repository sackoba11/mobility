import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_search_bar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../utils/constants/app colors/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../controllers/home_bus_controller.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      // backgroundColor: AppColor.white,
      expandedHeight: 240,
      flexibleSpace: PrimaryHeaderContainer(
        child: Column(
          children: [
            SizedBox(height: ZMDeviceUtils.getAppBarHeight() * 1.5),
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CustomSizes.defaultSpace,
                ),
                child: Text(
                  "Entrer le numero du bus à rechercher.",
                  style: TextStyle(fontSize: 30, color: AppColor.white),
                )),
            const SizedBox(height: CustomSizes.spaceBtwSections)
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(ZMDeviceUtils.getAppBarHeight() * 1.95),
        child: Container(
          color: AppColor.background,
          child: Column(
            children: [
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Container(
                width: 40,
                height: 5,
                decoration: ShapeDecoration(
                  color: const Color(0xFFA7AEB1),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFFA7AEB1)),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              GetBuilder<BusController>(
                init: BusController(),
                builder: (busController) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CustomSizes.defaultSpace),
                    child: CustomSearchBar(
                        hintText: "Bus Numéro ...",
                        textEditingController:
                            busController.textEditingController,
                        onChanged: (value) async {
                          if (busController
                              .textEditingController.text.isNotEmpty) {
                            await busController.getBusByNumber(int.tryParse(
                                busController.textEditingController.text)!);
                            busController.availableActiveBusList =
                                busController.searchActiveBus;
                          } else {
                            await busController.getAllBus();
                          }
                        }),
                  );
                },
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}