import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/views/unknown_page/unknown_page.dart';
import 'package:mobility/firebase_options.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(
    GetMaterialApp(
      unknownRoute: GetPage(
        name: Routes.unknownRoute,
        page: () => const UnknownPage(),
      ),
      debugShowCheckedModeBanner: false,
      title: "Mobility",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
