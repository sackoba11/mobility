import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app colors/app_colors.dart';
import '../../../repositories/authRepositiry/auth_repository_impl.dart';
import '../../driver/views/driver_view.dart';
import '../../services/controllers/services_controller.dart';
import '../../services/views/services_view.dart';
import '../../widgets/custom_search_bar.dart';
import '../controllers/home_driver_controller.dart';

class HomeDriverView extends GetView<HomeDriverController> {
  const HomeDriverView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeDriverController());
    return WillPopScope(
      onWillPop: () => ServicesController.onWillPop(context),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.black,
            elevation: 0,
            // leading: Container(
            //     margin: const EdgeInsets.only(left: 8),
            //     child: controller.currentUser?.photoURL != null
            //         ? CircleAvatar(
            //             backgroundImage:
            //                 NetworkImage(controller.currentUser!.photoURL!),
            //           )
            //         : CircleAvatar(
            //             child: Text(
            //               controller.currentUser!.displayName![0].toString(),
            //               textAlign: TextAlign.center,
            //               style: const TextStyle(
            //                   color: Colors.white, fontSize: 25),
            //             ),
            //           )),
            actions: [
              IconButton(
                  onPressed: () async {
                    await AuthRepositoryImpl()
                        .signOut()
                        .whenComplete(() => Get.offAll(const ServicesView()));
                  },
                  icon: Icon(
                    Icons.logout,
                    color: AppColor.white,
                    size: 30,
                  ))
            ],
          ),
          backgroundColor: AppColor.black,
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
            initState: (_) {},
            builder: (_) {
              return CustomSearchBar(
                  hintText: "Bus Numéro ...",
                  textEditingController: _.textEditingController,
                  onChanged: (value) {});
            },
          ),
          const SizedBox(height: 15),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const DriverView());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text("85"),
                        ),
                      ),
                    );
                  }))
        ]));
  }
}
