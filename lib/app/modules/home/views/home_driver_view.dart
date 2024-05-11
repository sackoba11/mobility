import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app colors/app_colors.dart';
import '../../../constants/typography/typography.dart';
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
            leading: _customAvatar(context),
            actions: [_logOut()],
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

  IconButton _logOut() {
    return IconButton(
        onPressed: () async {
          await AuthRepositoryImpl()
              .signOut()
              .whenComplete(() => Get.offAll(const ServicesView()));
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
            initState: (_) {},
            builder: (_) {
              return CustomSearchBar(
                  hintText: "Numéro Bus",
                  textEditingController: _.textEditingController,
                  onChanged: (value) {
                    if (_.textEditingController.text.isNotEmpty) {
                      _.number =
                          RxInt(int.tryParse(_.textEditingController.text)!);
                      if (_.number != null) {
                        _.getBusByNumber(_.number!);
                        _.availableBusList = _.searchBus;
                      }
                    } else {
                      _.getBus();
                      _.availableBusList = _.busList;
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
                initState: (_) {},
                builder: (_) {
                  if (_.availableBusList.isEmpty) {
                    return Center(
                      child:
                          Text("Aucun Bus de numéro ${_.number}  disponibles"),
                    );
                  }
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: ((context, snapshot) {
                      return Column(
                          children: _.availableBusList
                              .map(
                                (e) => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => DriverView(
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
                                              color: AppColor.black
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
                                                AppTypography().mediumDefault(
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
                                            AppTypography().lightSmall(
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
