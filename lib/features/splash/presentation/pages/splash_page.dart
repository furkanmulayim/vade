import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 2500), _openHome);
  }

  void _openHome() {
    if (!mounted) return;
    context.router.replace(const HomeRoute());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.primary,
    body: SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.camera_alt_outlined,
              size: 52,
              color: context.color.onPrimary,
            ),
            const SizedBox(height: 16),
            Text(
              LocaleKeys.name.tr(),
              style: context.typo.size24(
                color: context.color.onPrimary,
                weight: .w700,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
