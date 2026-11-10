import '../constants/locale_keys.g.dart';

enum FilterEnum {
  defaultOrder(LocaleKeys.home_sort_default),
  nearestFirst(LocaleKeys.home_sort_nearest),
  farthestFirst(LocaleKeys.home_sort_farthest),
  alphabeticalAZ(LocaleKeys.home_sort_a_z),
  alphabeticalZA(LocaleKeys.home_sort_z_a);

  const FilterEnum(this.titleKey);

  final String titleKey;
}
