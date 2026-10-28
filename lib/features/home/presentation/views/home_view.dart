import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';
import '../widgets/home_app_bar.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: HomeAppBar(
      nameCode: 'FM',
      onSearch: () => context.router.push(const SearchRoute()),
      onNotifications: () => context.router.push(const NotificationsRoute()),
    ),
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
