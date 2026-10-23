# Vade

Vade, feature-based clean mimariyle oluşturulan bir Flutter uygulamasıdır.
Yönlendirme için AutoRoute, çoklu dil desteği için Easy Localization kullanır.

## Başlangıç

```bash
flutter pub get
flutter run
```

```bash
dart run build_runner build
```

## State management ve dependency injection

Global UI state'i `core/providers/app_provider.dart` altında tutulur ve GetIt
ile `core/di/injection.dart` içinde kayıt edilir. Yeni global bağımlılıkları
`configureDependencies` fonksiyonuna ekleyin.

```bash
dart run easy_localization:generate -S assets/translations -O lib/core/constants -o locale_keys.g.dart -f keys
```

```bash
flutter analyze
flutter test
```
