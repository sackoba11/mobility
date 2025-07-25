import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobility/views/unknown_page/unknown_page.dart';
import 'package:mobility/firebase_options.dart';
import 'routes/app_pages.dart';
import 'utils/constants/app string/app_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        unknownRoute: GetPage(
          name: Paths.unknownRoute,
          page: () => const UnknownPage(),
        ),
        debugShowCheckedModeBanner: false,
        title: AppString.appTitle,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    ),
  );
}
