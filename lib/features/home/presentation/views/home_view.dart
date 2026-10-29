import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_status_card_widget.dart';

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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: HomeStatusCardWidget(
          totalCount: 80,
          upcomingCount: 23,
          expiredCount: 12,
          onCreate: () {
            context.router.push(const CreateRoute());
          },
        ),
      ),
    ),
  );
}
