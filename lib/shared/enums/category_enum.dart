import '../constants/asset_path.dart';

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
    CategoryEnum.electronics => "Elektronik",
    CategoryEnum.vehicleAndTransport => "Araç ve Ulaşım",
    CategoryEnum.homeLiving => "Ev Yaşam",
    CategoryEnum.health => "Sağlık",
    CategoryEnum.finance => "Finans",
    CategoryEnum.subscriptions => "Abonelikler",
    CategoryEnum.education => "Eğitim",
    CategoryEnum.other => "Diğer",
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
