import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobility/common/theme/app_theme.dart';
import 'package:mobility/firebase_options.dart';
import 'package:mobility/views/unknown_page/unknown_page.dart';

import 'routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Canal de communication avec le foreground service (tracking chauffeur).
  FlutterForegroundTask.initCommunicationPort();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
    );
  } catch (e) {
    debugPrint("Firebase init skipped: $e");
  }
  final serverClientId = dotenv.maybeGet('GOOGLE_SERVER_CLIENT_ID');
  if (serverClientId != null && serverClientId.isNotEmpty) {
    await GoogleSignIn.instance.initialize(serverClientId: serverClientId);
  } else {
    debugPrint("GOOGLE_SERVER_CLIENT_ID manquant dans .env");
  }
  runApp(
    GetMaterialApp(
      unknownRoute: GetPage(
        name: Paths.unknownRoute,
        page: () => const UnknownPage(),
      ),
      debugShowCheckedModeBanner: false,
      title: "Mobility",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
