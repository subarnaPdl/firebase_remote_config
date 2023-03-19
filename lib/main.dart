import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_config/core/locator.dart';
import 'package:remote_config/services/firebase_remote_config_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final FirebaseRemoteConfigService firebaseRemoteConfigService =
      Get.put(locator());

  @override
  Widget build(BuildContext context) {
    print('Build : ${firebaseRemoteConfigService.keys}');

    return GetMaterialApp(
      // translationsKeys: LocalizationLabels().keys,
      translationsKeys: firebaseRemoteConfigService.keys,
      locale: const Locale('np', 'NP'),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("su".tr),
            ),
          ],
        ),
      ),
    );
  }
}
