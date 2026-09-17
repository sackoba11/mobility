import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/help_functions/help_functions.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/typography/typography.dart';
import '../../../data/repositories/authRepositiry/auth_repository_impl.dart';
import '../../../common/widgets/custom_search_bar.dart';
import '../controllers/home_driver_controller.dart';

class HomeDriverScreen extends GetView<HomeDriverController> {
  const HomeDriverScreen({super.key});
  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HomeDriverController>()) {
      Get.put(HomeDriverController());
    }
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          HelpFunctions.onWillPop(context),
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
              .whenComplete(() => Get.offAllNamed(Paths.services));
        },
        icon: Icon(
          Icons.logout,
          color: AppColor.white,
          size: 30,
        ));
  }

  Container _customAvatar(BuildContext context) {
    final photoUrl = controller.currentUser?.photoURL;
    String initial = "?";
    final email = controller.currentUser?.email?.trim();
    if (email != null && email.isNotEmpty) {
      initial = email[0].toUpperCase();
    }
    return Container(
        margin: const EdgeInsets.only(left: 8),
        child: photoUrl != null && photoUrl.isNotEmpty
            ? CircleAvatar(
                backgroundImage: NetworkImage(photoUrl),
              )
            : CircleAvatar(
                child: Text(
                  initial,
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
            builder: (homeDriverController) {
              return CustomSearchBar(
                  hintText: "Numéro Bus",
                  textEditingController:
                      homeDriverController.textEditingController,
                  onChanged: (value) {
                    final text =
                        homeDriverController.textEditingController.text.trim();
                    if (text.isNotEmpty) {
                      final parsed = int.tryParse(text);
                      if (parsed == null) {
                        // Recherche textuelle tolérante : aucun numéro valide
                        homeDriverController.searchBus = [];
                        homeDriverController.availableBusList = [];
                        homeDriverController.update();
                        return;
                      }
                      homeDriverController.number = RxInt(parsed);
                      homeDriverController.getBusByNumber(parsed);
                      homeDriverController.availableBusList =
                          homeDriverController.searchBus;
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
                builder: (homeDriverController) {
                  if (homeDriverController.availableBusList.isEmpty) {
                    return Center(
                      child: Text(
                          "Aucun Bus de numéro ${homeDriverController.textEditingController.text} disponibles"),
                    );
                  }
                  return ListView.builder(
                    itemCount:
                        homeDriverController.availableBusList.length,
                    itemBuilder: ((context, index) {
                      final e =
                          homeDriverController.availableBusList[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Paths.driver, arguments: e);
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
                                                  .withValues(alpha: .3),
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
                                    const SizedBox(height: 5),
                          ],
                        );
                      }),
                    );
                },
              ),
            );
          }),
        ]));
  }
}
