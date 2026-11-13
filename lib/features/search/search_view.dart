import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

import '../../shared/constants/locale_keys.g.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(LocaleKeys.home_search.tr())),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: Text(LocaleKeys.home_search.tr())),
      ),
    ),
  );
}
