import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: Text(
          LocaleKeys.navigation_home.tr(),
          style: context.typo.size24(weight: .w500),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
