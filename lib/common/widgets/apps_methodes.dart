import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/common/widgets/widget.bottomSheet/dodgeKeyboard.dart';
import 'package:mobility/common/widgets/widget.bottomSheet/my_bottomSheet_register.dart';
import '../assets/assets.gen.dart';
import '../../utils/constants/app colors/app_colors.dart';
import '../../utils/constants/app string/app_string.dart';
import '../../utils/constants/typography/typography.dart';
import 'custom_button.dart';
import 'illustrator.dart';

import 'infos_car.dart';
import 'infos_destination.dart';
import 'login_with_google_btn.dart';
import 'widget.bottomSheet/my_bottomSheet_login.dart';

Future showDriverLogin(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (BuildContext context) {
      return DodgeKeyboard(
        child: DraggableScrollableSheet(
          expand: false,
          builder: (
            BuildContext context,
            ScrollController controller,
          ) {
            return MyBottomSheetLogin(
              scrollController: controller,
            );
          },
        ),
      );
    },
  );
}

Future showDriverRegister(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return DodgeKeyboard(
        child: DraggableScrollableSheet(
          expand: false,
          builder: (
            BuildContext context,
            ScrollController controller,
          ) {
            return MyBottomSheetRegister(
              scrollController: controller,
            );
          },
        ),
      );
    },
  );
}

Future showGoogleLoginSHeet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
          height: 200,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // color: AppColor.gray,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppTypography().regularDefault(
                    text: "Connectez-vous avec votre compte Google",
                    color: AppColor.black),
                const SizedBox(
                  height: 20,
                ),
                const LoginWithGoogleButton()
              ],
            ),
          ));
    },
  );
}

AppBar customAppBar({String textBack = "", var onTap, required String title}) {
  return AppBar(
      elevation: 0.3,
      backgroundColor: AppColor.background,
      leadingWidth: 150,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 30,
          width: 69,
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16,
              ),
              Text(
                textBack,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              )
            ],
          ),
        ),
      ),
      actions: [
        (onTap == null)
            ? Container()
            : GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: Assets.vector4.provider())),
                ),
              )
      ]);
}

Future<dynamic> custombottomSheet({String? title, String? secondtitle}) {
  return Get.bottomSheet(SingleChildScrollView(
    child: Container(
      height: 350,
      decoration: BoxDecoration(
          color: AppColor.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(17), topRight: Radius.circular(17))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomButton(
                icon: Assets.icon.toString(),
                title: AppString.chooseCurrentLocation,
                radius: 40,
                ontap: () {}),
            const SizedBox(
              height: 10,
            ),
            const Text("ou"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: AppString.start,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 17,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: AppString.destination,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      title: title!,
                      ontap: () {
                        (secondtitle == "user")
                            ? secondBottomSheetUser()
                            : secondBottomSheetDriver();
                      },
                      radius: 15),
                )
              ],
            )
          ],
        ),
      ),
    ),
  ));
}

Future<dynamic> secondBottomSheetUser() {
  return Get.bottomSheet(
    SingleChildScrollView(
      child: Container(
        height: 350,
        decoration: BoxDecoration(
            color: AppColor.background,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(17), topRight: Radius.circular(17))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 184,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8, right: 8),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4.0, top: 5),
                                      child: Container(
                                        width: 2,
                                        height: 800,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                              AppColor.black,
                                              Color(0xFFD2D3DA)
                                            ])),
                                      ),
                                    )
                                  ],
                                ),
                                const Column(
                                  children: [
                                    InfosDestination(
                                      infos: "Stop 1",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 2",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 3",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 4",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 5",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 6",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 7",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 8",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 9",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 10",
                                    ),
                                    InfosDestination(
                                      infos: "Stop3",
                                    ),
                                    InfosDestination(
                                      infos: "Stop4",
                                    ),
                                    InfosDestination(
                                      infos: "Stop1",
                                    ),
                                    InfosDestination(
                                      infos: "Stop2",
                                    ),
                                    InfosDestination(
                                      infos: "Stop3",
                                    ),
                                    InfosDestination(
                                      infos: "Stop4",
                                    ),
                                    InfosDestination(
                                      infos: "Stop1",
                                    ),
                                    InfosDestination(
                                      infos: "Stop2",
                                    ),
                                    InfosDestination(
                                      infos: "Stop3",
                                    ),
                                    InfosDestination(
                                      infos: "Stop4",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 184,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Illustrator(
                                illustrator: Assets.vector3.toString(),
                                height: 35,
                                width: 30),
                            const SizedBox(
                              height: 10,
                            ),
                            InfosCar(infos: AppString.typeofcar),
                            InfosCar(infos: AppString.colorCar),
                            InfosCar(infos: AppString.matriculationCar),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          title: AppString.canceltracking,
                          ontap: () {
                            Get.back();
                          },
                          radius: 15))
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Future<dynamic> secondBottomSheetDriver() {
  return Get.bottomSheet(
    SingleChildScrollView(
      child: Container(
        height: 350,
        decoration: BoxDecoration(
            color: AppColor.background,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(17), topRight: Radius.circular(17))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 184,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8, right: 8),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4.0, top: 5),
                                      child: Container(
                                        width: 2,
                                        height: 800,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                              AppColor.black,
                                              Color(0xFFD2D3DA)
                                            ])),
                                      ),
                                    )
                                  ],
                                ),
                                const Column(
                                  children: [
                                    InfosDestination(
                                      infos: "Stop 1",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 2",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 3",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 4",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 5",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 6",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 7",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 8",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 9",
                                    ),
                                    InfosDestination(
                                      infos: "Stop 10",
                                    ),
                                    InfosDestination(
                                      infos: "Stop3",
                                    ),
                                    InfosDestination(
                                      infos: "Stop4",
                                    ),
                                    InfosDestination(
                                      infos: "Stop1",
                                    ),
                                    InfosDestination(
                                      infos: "Stop2",
                                    ),
                                    InfosDestination(
                                      infos: "Stop3",
                                    ),
                                    InfosDestination(
                                      infos: "Stop4",
                                    ),
                                    InfosDestination(
                                      infos: "Stop1",
                                    ),
                                    InfosDestination(
                                      infos: "Stop2",
                                    ),
                                    InfosDestination(
                                      infos: "Stop3",
                                    ),
                                    InfosDestination(
                                      infos: "Stop4",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 184,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColor.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Illustrator(
                                illustrator: Assets.gbaka.toString(),
                                height: 35,
                                width: 30),
                            const SizedBox(
                              height: 10,
                            ),
                            InfosCar(infos: AppString.typeofcar),
                            InfosCar(infos: AppString.colorCar),
                            InfosCar(infos: AppString.matriculationCar),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          title: AppString.canceltracking,
                          ontap: () {
                            Get.back();
                          },
                          radius: 15))
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Future<dynamic> popupLogout() {
  return Get.defaultDialog(
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black,
      backgroundColor: AppColor.background,
      buttonColor: AppColor.error,
      title: AppString.areyousure,
      textConfirm: AppString.yes,
      content: Text(AppString.doyouwanttodisconnect),
      onConfirm: () {
        Get.offAllNamed(AppString.home);
      },
      onCancel: () {});
}
