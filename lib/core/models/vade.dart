import '../../shared/enums/category_enum.dart';

class Vade {
  const Vade({
    required this.id,
    required this.name,
    required this.description,
    required this.iconPath,
    required this.category,
    required this.startDate,
    required this.endDate,
    this.documentCount = 0,
  }) : assert(documentCount >= 0);

  final String id;
  final String name;
  final String description;
  final String iconPath;
  final CategoryEnum category;
  final DateTime startDate;
  final DateTime endDate;
  final int documentCount;
}
