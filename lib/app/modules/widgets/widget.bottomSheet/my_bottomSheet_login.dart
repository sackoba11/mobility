import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/controllers/services_controller.dart';
import '../apps_methodes.dart';
import '../custom_input.dart';
import '../login_btn.dart';

class MyBottomSheetLogin extends StatefulWidget {
  final ScrollController scrollController;
  const MyBottomSheetLogin({
    super.key,
    required this.scrollController,
  });

  @override
  State<MyBottomSheetLogin> createState() => _MyBottomSheetLoginState();
}

class _MyBottomSheetLoginState extends State<MyBottomSheetLogin> {
  @override
  void initState() {
    super.initState();
    Get.put(ServicesController);
  }

  final _formKey = GlobalKey<FormState>();
  var controller = Get.find<ServicesController>();
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
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomInput(
                          hint: "Email",
                          controller: controller.email,
                          keyboardType: TextInputType.emailAddress,
                          textError: controller.emailTextError,
                          validator: validateEmail,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomInput(
                          hint: "Mot de passe",
                          controller: controller.password,
                          keyboardType: TextInputType.visiblePassword,
                          textError: controller.passwordTextError,
                          validator: passwordValid,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginButton(
                          formKey: _formKey,
                          login: true,
                          title: "Se connecter",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () => showDriverRegister(context),
                            child: const Center(
                              child: Text(
                                'Vous n’avez pas de compte?, S’inscrire',
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

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      setState(() {
        controller.emailTextError = 'Saisissez votre email';
      });
      return controller.emailTextError!;
    } else if (!isEmailValid(value)) {
      setState(() {
        controller.emailTextError = 'Entrez un email valide';
      });
      return controller.emailTextError!;
    } else {
      setState(() {
        controller.emailTextError = null;
      });
      return null;
    }
  }

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  String? passwordValid(String? value) {
    if (value!.isEmpty || value.length < 8) {
      setState(() {
        controller.passwordTextError = "Saisissez un mot de passe valide";
      });
      return controller.passwordTextError!;
    } else {
      setState(() {
        controller.passwordTextError = null;
      });
    }
    return null;
  }
}
