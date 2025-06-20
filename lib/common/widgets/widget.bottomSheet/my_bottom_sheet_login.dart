import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/validators/validator.dart';
import '../../../views/services/controllers/services_controller.dart';
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
  final _formKey = GlobalKey<FormState>();
  var controller = Get.find<ServicesController>();

  @override
  void initState() {
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
            height: constaints.minHeight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomInput(
                          hint: "Email",
                          controller: controller.emailLogin,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.validateEmail,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomInput(
                          hint: "Mot de passe",
                          controller: controller.passwordLogin,
                          keyboardType: TextInputType.visiblePassword,
                          validator: Validator.validatePassword,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        LoginButton(
                          formKey: _formKey,
                          title: "Se connecter",
                        ),
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
}
