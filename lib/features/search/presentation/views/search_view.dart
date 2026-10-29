import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/locale_keys.g.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.tr(LocaleKeys.home_search))),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: Text(context.tr(LocaleKeys.home_search))),
      ),
    ),
  );
}
