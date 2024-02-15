import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/controllers/services_controller.dart';
import '../custom_input.dart';
import '../login_btn.dart';

class MyBottomSheetRegister extends StatefulWidget {
  final ScrollController scrollController;
  const MyBottomSheetRegister({
    super.key,
    required this.scrollController,
  });

  @override
  State<MyBottomSheetRegister> createState() => _MyBottomSheetRegisterState();
}

class _MyBottomSheetRegisterState extends State<MyBottomSheetRegister> {
  final controller = Get.find<ServicesController>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(ServicesController);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constaints) {
        return SingleChildScrollView(
          controller: widget.scrollController,
          child: SizedBox(
            height: constaints.maxHeight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        CustomInput(
                          hint: "Nom",
                          controller: controller.name,
                          textError: controller.nameTextError,
                          validator: validName,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomInput(
                          hint: "Numero",
                          controller: controller.number,
                          keyboardType: TextInputType.phone,
                          textError: controller.numberTextError,
                          validator: validNumber,
                          maxlength: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomInput(
                          hint: "Email",
                          controller: controller.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomInput(
                          hint: "Mot de passe",
                          controller: controller.password,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomInput(
                            hint: "Type de transport",
                            controller: controller.typeOfCar),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomInput(
                            hint: "Immatriculation",
                            controller: controller.brand),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomInput(
                            hint: "Couleur du vehicule",
                            controller: controller.color),
                        const SizedBox(
                          height: 10,
                        ),
                        LoginButton(
                          formKey: formKey,
                          login: false,
                          title: "S'inscrire",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () => Get.back(),
                            child: const Center(
                              child: Text(
                                'Avez-vous un compte? Se connecter',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF263238),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  height: 0,
                                ),
                              ),
                            ))
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String? validName(String? value) {
    if (value!.isEmpty || value.length < 5) {
      setState(() {
        controller.nameTextError = "Saisissez votre nom complet";
      });
      return controller.nameTextError;
    } else {
      setState(() {
        controller.nameTextError = null;
      });
      return null;
    }
  }

  String? validNumber(String? value) {
    if (value!.isEmpty) {
      setState(() {
        controller.numberTextError = "saisissez le bon numéro";
      });
      return controller.numberTextError;
    } else if (value.length != 10) {
      setState(() {
        controller.numberTextError = "Saisissz un numéro de 10 chiffres";
      });
      return null;
    } else {
      setState(() {
        controller.numberTextError = null;
      });
      return null;
    }
  }
}
