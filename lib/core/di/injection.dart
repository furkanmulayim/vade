import 'package:get_it/get_it.dart';

import '../providers/app_provider.dart';

/// Uygulama genelinde kullanılan bağımlılıkların kayıt noktasıdır.
final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<AppProvider>(AppProvider.new);
}
