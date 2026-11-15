import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:material_ui/material_ui.dart';

import '../../app/router/app_router.dart';
import '../../core/di/injection.dart';
import '../../core/preferences/shared_prefs.dart';
import '../../shared/extensions/context_extension.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 2500), _openHome);
  }

  Future<void> _openHome() async {
    var completed = false;
    try {
      completed = await getIt<SharedPrefs>().isOnboardingCompleted;
    } catch (_) {
      // Okunamayan tercihlerde tanıtımı tekrar göster.
    }
    if (!mounted) return;
    context.router.replace(
      completed ? const MainRoute() : const OnboardingRoute(),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.card,
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
              "Autocar",
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
