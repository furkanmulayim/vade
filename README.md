# Vade

Vade, **feature-based clean architecture** yaklaşımıyla geliştirilen bir Flutter uygulamasıdır.

> 🚧 **Geliştirme aşamasında**
>
> Proje henüz başlangıç aşamasındadır. Mimari yapı ve özellikler geliştirme sürecinde değişebilir.

## Teknolojiler

- **Flutter & Dart** — Uygulama geliştirme
- **Clean Architecture** — Mimari yaklaşım
- **AutoRoute** — Sayfa yönlendirme
- **GetIt & Injectable** — Bağımlılık yönetimi
- **Easy Localization** — Çoklu dil desteği
- **Provider** — State management

## Başlangıç

Bağımlılıkları yükleyip uygulamayı çalıştırın:

```bash
flutter pub get
flutter run
```

Kod üretimi:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Çeviri dosyalarını üretme:

```bash
dart run easy_localization:generate -S assets/translations -O lib
```

## Test ve analiz

```bash
flutter analyze
flutter test
```
