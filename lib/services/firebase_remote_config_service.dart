import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:remote_config/l10n/translations.dart';

class FirebaseRemoteConfigService extends GetxController {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  Map<String, Map<String, String>> keys = {};

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    try {
      // When the condition in firebase become false, default translations from translations.dart is shown, else the translation given in firebase is shown
      await remoteConfig.setDefaults({
        "translations": jsonEncode(LocalizationLabels().keys),
      });
      await remoteConfig.ensureInitialized();

      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 0),
        // fetchTimeout: const Duration(seconds: 10),
        // minimumFetchInterval: const Duration(days: 1),
      ));

      await remoteConfig.fetchAndActivate();
      getTranslationsKeys();
    } catch (e) {
      print('Error : $e');
    }
  }

  void getTranslationsKeys() {
    final json = remoteConfig.getString("translations");
    Map<String, dynamic> decodedJson = jsonDecode(json);
    for (var a in decodedJson.entries) {
      keys.addAll({a.key: Map<String, String>.from(a.value)});
    }

    print('Init : $keys');

    Get.translations.addAll(keys);
    Get.forceAppUpdate();
  }
}
