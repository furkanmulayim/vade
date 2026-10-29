import '../../../../core/constants/asset_path.dart';
import '../../../../core/constants/locale_keys.g.dart';

enum CategoryEnum {
  electronics('electronics'), // Elektronik
  homeLiving('home_living'), // Ev Yaşam
  education('education'), // Eğitim
  health('health'), // Sağlık
  vehicleAndTransport('vehicle'), // Araç ve Ulaşım
  finance('finance'), // Finans
  subscriptions('subscriptions'), // Abonelikler
  other('other'); // Diğer

  const CategoryEnum(this.id);

  final String id;
}

extension CategoryExtension on CategoryEnum {
  String get titleKey => switch (this) {
    CategoryEnum.electronics => LocaleKeys.category_electronics,
    CategoryEnum.vehicleAndTransport =>
      LocaleKeys.category_vehicle_and_transport,
    CategoryEnum.homeLiving => LocaleKeys.category_home_living,
    CategoryEnum.health => LocaleKeys.category_health,
    CategoryEnum.finance => LocaleKeys.category_finance,
    CategoryEnum.subscriptions => LocaleKeys.category_subscriptions,
    CategoryEnum.education => LocaleKeys.category_education,
    CategoryEnum.other => LocaleKeys.category_other,
  };

  String get icon => switch (this) {
    CategoryEnum.electronics => AssetPath.categoryElectronics,
    CategoryEnum.vehicleAndTransport => AssetPath.categoryVehicle,
    CategoryEnum.homeLiving => AssetPath.categoryHome,
    CategoryEnum.health => AssetPath.categoryMedical,
    CategoryEnum.finance => AssetPath.categoryFinance,
    CategoryEnum.subscriptions => AssetPath.categorySubscriptions,
    CategoryEnum.education => AssetPath.categoryEducation,
    CategoryEnum.other => AssetPath.categoryOther,
  };
}
