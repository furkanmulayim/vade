import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vade/core/widgets/button_mini_primary.dart';

import '../../../../app/router/app_router.dart';
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
        child: ButtonMiniPrimary(
          text: 'Yeni Kayıt',
          onPressed: () {},
          isDisabled: true,
        ),
      ),
    ),
  );
}
