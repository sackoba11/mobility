import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobility/views/unknown_page/unknown_page.dart';
import 'package:mobility/firebase_options.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  await GoogleSignIn.instance.initialize(
    // clientId:
    //     'mobilityplus-74105', // requis sur iOS/macOS/web si pas dans un fichier de conf
    serverClientId:
        '714842411456-5e2aknnofo1d8esftj3l7t3miplk3e0h.apps.googleusercontent.com', // requis si tu veux un idToken pour un backend
  );
  runApp(
    GetMaterialApp(
      unknownRoute: GetPage(
        name: Paths.unknownRoute,
        page: () => const UnknownPage(),
      ),
      debugShowCheckedModeBanner: false,
      title: "Mobility",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
