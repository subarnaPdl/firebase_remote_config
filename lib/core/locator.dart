import 'package:get_it/get_it.dart';
import 'package:remote_config/services/firebase_remote_config_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<FirebaseRemoteConfigService>(
      () => FirebaseRemoteConfigService());
}
