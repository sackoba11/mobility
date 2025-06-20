import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/typography/typography.dart';
import '../../../data/repositories/authRepositiry/auth_repository_impl.dart';
import '../../../utils/helpers/helpers.dart';
import '../../driver/screens/driver_screen.dart';
import '../../services/screens/services_screen.dart';
import '../../../common/widgets/custom_search_bar.dart';
import '../controllers/home_driver_controller.dart';

class HomeDriverScreen extends GetView<HomeDriverController> {
  const HomeDriverScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeDriverController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => Helpers.onWillPop(context),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primary,
            elevation: 0,
            leading: _customAvatar(context),
            actions: [_logOut()],
          ),
          backgroundColor: AppColor.primary,
          body: Stack(children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Text(
                  "Numero du bus à mettre en service.",
                  style: TextStyle(fontSize: 30, color: AppColor.white),
                )),
            DraggableScrollableSheet(
              minChildSize: .3,
              maxChildSize: .7,
              initialChildSize: .7,
              builder: (context, controller) {
                return Container(
                  color: AppColor.background,
                  child: _buildColumn(context),
                );
              },
            )
          ])),
    );
  }

  IconButton _logOut() {
    return IconButton(
        onPressed: () async {
          await AuthRepositoryImpl()
              .signOut()
              .whenComplete(() => Get.offAll(const ServiceScreen()));
        },
        icon: Icon(
          Icons.logout,
          color: AppColor.white,
          size: 30,
        ));
  }

  Container _customAvatar(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 8),
        child: controller.currentUser?.photoURL != null
            ? CircleAvatar(
                backgroundImage:
                    NetworkImage(controller.currentUser!.photoURL!),
              )
            : CircleAvatar(
                child: Text(
                  controller.currentUser!.email![0].toString().toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ));
  }

  Widget _buildColumn(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 10),
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
          const SizedBox(height: 20),
          GetBuilder<HomeDriverController>(
            init: HomeDriverController(),
            builder: (homeDriverController) {
              return CustomSearchBar(
                  hintText: "Numéro Bus",
                  textEditingController:
                      homeDriverController.textEditingController,
                  onChanged: (value) {
                    if (homeDriverController
                        .textEditingController.text.isNotEmpty) {
                      homeDriverController.number = RxInt(int.tryParse(
                          homeDriverController.textEditingController.text)!);
                      if (homeDriverController.number != null) {
                        homeDriverController
                            .getBusByNumber(homeDriverController.number!);
                        homeDriverController.availableBusList =
                            homeDriverController.searchBus;
                      }
                    } else {
                      homeDriverController.getBus();
                      homeDriverController.availableBusList =
                          homeDriverController.busList;
                    }
                  });
            },
          ),
          const SizedBox(height: 15),
          Obx(() {
            if (controller.isLoading.value == true) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.primary,
                ),
              );
            }
            if (controller.availableBusList.isEmpty) {
              return const Center(
                child: Text("Pas de bus disponibles"),
              );
            }
            return Expanded(
              child: GetBuilder<HomeDriverController>(
                init: HomeDriverController(),
                builder: (homeDriverController) {
                  if (homeDriverController.availableBusList.isEmpty) {
                    return Center(
                      child: Text(
                          "Aucun Bus de numéro ${homeDriverController.number}  disponibles"),
                    );
                  }
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: ((context, snapshot) {
                      return Column(
                          children: homeDriverController.availableBusList
                              .map(
                                (e) => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => DriverScreen(
                                              busSelected: e,
                                            ));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: AppColor.primary
                                                  .withOpacity(.3),
                                            )),
                                        width: double.infinity,
                                        height: 70,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AppTypography.mediumDefault(
                                                    text: e.number.toString()),
                                                e.isActive == true
                                                    ? const Text(
                                                        "Actif",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.green),
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            AppTypography.lightSmall(
                                                text:
                                                    "${e.source}  <->  ${e.destination}")
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    )
                                  ],
                                ),
                              )
                              .toList());
                    }),
                  );
                },
              ),
            );
          }),
        ]));
  }
}
