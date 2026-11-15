import 'package:get_it/get_it.dart';

import '../providers/app_provider.dart';
import '../preferences/shared_prefs.dart';

/// Uygulama genelinde kullanılan bağımlılıkların kayıt noktasıdır.
final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<SharedPrefs>(SharedPrefs.new);
  getIt.registerLazySingleton<AppProvider>(AppProvider.new);
}
