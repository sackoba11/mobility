import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobility/app/assets/assets.gen.dart';
import 'package:mobility/app/modules/bus/views/home_bus.dart';
import 'package:mobility/app/modules/otherCar/views/home_other_car_view.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../../constants/typography/typography.dart';
import '../../widgets/custom_button_without_ontap.dart';
import '../controllers/home_user_controller.dart';

class HomeUserView extends GetView<HomeDriverController> {
  const HomeUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                // await FirebaseHelper().signOutFromGoogle();
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => ServicePage()));
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
                size: 30,
              ))
        ],
        backgroundColor: AppColor.background,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTypography()
                  .regularBig(text: "Bienvenue  👐", color: AppColor.black),
              const SizedBox(
                height: 20,
              ),
              AppTypography().regularDefault(
                  text:
                      "Veuillez choisir le type  de transport pour votre voyage",
                  color: AppColor.black),
              const SizedBox(
                height: 130,
              ),
              TextButton(
                onPressed: () {
                  Get.to(const HomeBus());
                },
                child: CustomButtonWithoutOnTap(
                  icon: Assets.bus.svg(),
                  title: "Bus",
                  subtitle: "Sotra",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const HomeOtherCarView());
                },
                child: CustomButtonWithoutOnTap(
                  icon: Assets.bus.svg(),
                  title: "Autre",
                  subtitle: "Gbaka, Taxi",
                ),
              ),
            ],
          )),
    );
  }
}
