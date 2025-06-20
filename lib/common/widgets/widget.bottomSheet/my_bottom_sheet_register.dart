// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../views/services/controllers/services_controller.dart';
// import '../custom_input.dart';
// import '../login_btn.dart';

// class MyBottomSheetRegister extends StatefulWidget {
//   final ScrollController scrollController;
//   const MyBottomSheetRegister({
//     super.key,
//     required this.scrollController,
//   });

//   @override
//   State<MyBottomSheetRegister> createState() => _MyBottomSheetRegisterState();
// }

// class _MyBottomSheetRegisterState extends State<MyBottomSheetRegister> {
//   final controller = Get.find<ServicesController>();
//   final formKey = GlobalKey<FormState>();

//   String? selectedValue;

//   @override
//   void initState() {
//     super.initState();
//     Get.put(ServicesController);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constaints) {
//         return SingleChildScrollView(
//           controller: widget.scrollController,
//           child: SizedBox(
//             height: constaints.maxHeight,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Expanded(
//                         child: ListView(
//                       children: [
//                         CustomInput(
//                           hint: "Nom",
//                           controller: controller.name,
//                           keyboardType: TextInputType.text,
//                           textError: controller.nameTextError,
//                           validator: validName,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         CustomInput(
//                           hint: "Numero",
//                           controller: controller.number,
//                           keyboardType: TextInputType.phone,
//                           textError: controller.numberTextError,
//                           validator: validNumber,
//                           maxlength: 10,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         CustomInput(
//                           hint: "Email",
//                           controller: controller.email,
//                           keyboardType: TextInputType.emailAddress,
//                           textError: controller.emailTextError,
//                           validator: validateEmail,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         CustomInput(
//                           hint: "Mot de passe",
//                           controller: controller.password,
//                           keyboardType: TextInputType.visiblePassword,
//                           textError: controller.passwordTextError,
//                           validator: passwordValid,
//                         ),
//                         // const SizedBox(
//                         //   height: 10,
//                         // ),
//                         // Padding(
//                         //   padding: const EdgeInsets.symmetric(horizontal: 15),
//                         //   child: Container(
//                         //     height: 60,
//                         //     decoration: BoxDecoration(
//                         //         border: Border.all(
//                         //             width: 0.5, color: AppColor.primary),
//                         //         borderRadius: BorderRadius.circular(15)),
//                         //     child: DropdownButtonHideUnderline(
//                         //       child: DropdownButton2<String>(
//                         //         isExpanded: true,
//                         //         hint: Text('Type de Transport',
//                         //             style: TextStyle(color: AppColor.black)),
//                         //         items: controller.items
//                         //             .map((String item) =>
//                         //                 DropdownMenuItem<String>(
//                         //                   value: item,
//                         //                   child: Text(
//                         //                     item,
//                         //                     style: TextStyle(
//                         //                         color: AppColor.black),
//                         //                   ),
//                         //                 ))
//                         //             .toList(),
//                         //         value: selectedValue,
//                         //         onChanged: (String? value) {
//                         //           setState(() {
//                         //             selectedValue = value;
//                         //             controller.typeOfCar = selectedValue;
//                         //           });
//                         //         },
//                         //         buttonStyleData: const ButtonStyleData(
//                         //           padding: EdgeInsets.symmetric(horizontal: 16),
//                         //           height: 40,
//                         //           width: 140,
//                         //         ),
//                         //         menuItemStyleData: const MenuItemStyleData(
//                         //           height: 40,
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                         // const SizedBox(
//                         //   height: 10,
//                         // ),
//                         // CustomInput(
//                         //   hint: "Immatriculation",
//                         //   controller: controller.brand,
//                         //   textError: controller.brandTextError,
//                         //   validator: immatriculationValid,
//                         // ),
//                         // const SizedBox(
//                         //   height: 10,
//                         // ),
//                         // CustomInput(
//                         //   hint: "Couleur du vehicule",
//                         //   controller: controller.color,
//                         //   textError: controller.colorTextError,
//                         //   validator: couleurValid,
//                         // ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         LoginButton(
//                           formKey: formKey,
//                           login: false,
//                           title: "S'inscrire",
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         TextButton(
//                             onPressed: () => Get.back(),
//                             child: const Center(
//                               child: Text(
//                                 'Avez-vous un compte? Se connecter',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Color(0xFF263238),
//                                   fontSize: 14,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w400,
//                                   decoration: TextDecoration.underline,
//                                   height: 0,
//                                 ),
//                               ),
//                             ))
//                       ],
//                     )),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   String? validName(String? value) {
//     if (value!.isEmpty) {
//       setState(() {
//         controller.nameTextError = "Saisissez votre nom complet";
//       });
//       return controller.nameTextError;
//     } else if (value.length < 5) {
//       setState(() {
//         controller.nameTextError = "Saisissez un nom valide";
//       });
//       return controller.nameTextError;
//     } else {
//       setState(() {
//         controller.nameTextError = null;
//       });
//       return null;
//     }
//   }

//   String? validNumber(String? value) {
//     if (value!.isEmpty) {
//       setState(() {
//         controller.numberTextError = "saisissez un numéro";
//       });
//       return controller.numberTextError;
//     } else if (value.length != 10) {
//       setState(() {
//         controller.numberTextError = "Saisissz un numéro de 10 chiffres";
//       });
//       return null;
//     } else {
//       setState(() {
//         controller.numberTextError = null;
//       });
//       return null;
//     }
//   }

//   String? validateEmail(String? value) {
//     if (value!.isEmpty) {
//       setState(() {
//         controller.emailTextError = 'Saisissez votre email';
//       });
//       return controller.emailTextError!;
//     } else if (!controller.isEmailValid(value)) {
//       setState(() {
//         controller.emailTextError = 'Entrez un email valide';
//       });
//       return controller.emailTextError!;
//     } else {
//       setState(() {
//         controller.emailTextError = null;
//       });
//       return null;
//     }
//   }

//   String? passwordValid(String? value) {
//     if (value!.isEmpty || value.length < 8) {
//       setState(() {
//         controller.passwordTextError = "Saisissez un mot de passe valide";
//       });
//       return controller.passwordTextError!;
//     } else {
//       setState(() {
//         controller.passwordTextError = null;
//       });
//     }
//     return null;
//   }

//   String? immatriculationValid(String? value) {
//     if (value!.isEmpty || value.length < 8) {
//       setState(() {
//         controller.brandTextError = "Saisissez une immatriculation valide";
//       });
//       return controller.brandTextError!;
//     } else {
//       setState(() {
//         controller.brandTextError = null;
//       });
//     }
//     return null;
//   }

//   String? couleurValid(String? value) {
//     if (value!.isEmpty) {
//       setState(() {
//         controller.colorTextError = "Saisissez la couleur de votre véhicule";
//       });
//       return controller.colorTextError!;
//     } else {
//       setState(() {
//         controller.colorTextError = null;
//       });
//     }
//     return null;
//   }
// }
