import '../../shared/enums/category_enum.dart';
import 'vade.dart';

// Geçici örnek veriler, kayıt kaynağı bağlandığında değiştirilecek.
List<Vade> getSampleRecords() {
  return [
    Vade(
      id: 'sample-1',
      category: CategoryEnum.electronics,
      iconPath: CategoryEnum.electronics.icon,
      name: 'Özel Sağlık Sigortası',
      description: 'Tamamlayıcı sağlık sigortası plan (A)',
      startDate: DateTime(2026, 1, 1),
      endDate: DateTime(2027, 5, 5),
      documentCount: 0,
    ),
    Vade(
      id: 'sample-2',
      category: CategoryEnum.homeLiving,
      iconPath: CategoryEnum.homeLiving.icon,
      name: 'MacBook Air M2',
      description: 'Kişisel edit yaptığım bilgisayarım',
      startDate: DateTime(2026, 1, 1),
      endDate: DateTime(2026, 11, 21),
      documentCount: 2,
    ),
    Vade(
      id: 'sample-3',
      category: CategoryEnum.homeLiving,
      iconPath: CategoryEnum.homeLiving.icon,
      name: 'Hyundai Kasko',
      description: 'Garanti bankası ile yapılan anlaşmalı sigorta',
      startDate: DateTime(2026, 1, 1),
      endDate: DateTime(2026, 10, 30),
      documentCount: 0,
    ),
    Vade(
      id: 'sample-4',
      category: CategoryEnum.education,
      iconPath: CategoryEnum.education.icon,
      name: 'Hyundai Kasko',
      description: 'Garanti bankası ile yapılan anlaşmalı sigorta',
      startDate: DateTime(2026, 1, 1),
      endDate: DateTime(2026, 10, 30),
      documentCount: 0,
    ),
    Vade(
      id: 'sample-4',
      category: CategoryEnum.education,
      iconPath: CategoryEnum.education.icon,
      name: 'Hyundai Kasko',
      description: 'Garanti bankası ile yapılan anlaşmalı sigorta',
      startDate: DateTime(2026, 1, 1),
      endDate: DateTime(2026, 10, 30),
      documentCount: 0,
    ),
    Vade(
      id: 'sample-4',
      category: CategoryEnum.education,
      iconPath: CategoryEnum.education.icon,
      name: 'Hyundai Kasko',
      description: 'Garanti bankası ile yapılan anlaşmalı sigorta',
      startDate: DateTime(2026, 1, 1),
      endDate: DateTime(2026, 10, 30),
      documentCount: 0,
    ),
  ];
}
