import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import 'app_localization.dart';

/// Keeps translations in sync with the platform without recreating the app.
class SystemLocaleSync extends StatefulWidget {
  const SystemLocaleSync({required this.child, super.key});

  final Widget child;

  @override
  State<SystemLocaleSync> createState() => _SystemLocaleSyncState();
}

class _SystemLocaleSyncState extends State<SystemLocaleSync>
    with WidgetsBindingObserver {
  bool _syncing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncLocale());
  }

  @override
  void didChangeLocales(List<Locale>? locales) => _syncLocale();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _syncLocale();
  }

  Locale _resolveLocale() {
    final preferredLocales = WidgetsBinding.instance.platformDispatcher.locales;
    for (final preferred in preferredLocales) {
      for (final supported in AppLocalization.supportedLocales) {
        if (preferred.languageCode == supported.languageCode) return supported;
      }
    }
    return AppLocalization.fallbackLocale;
  }

  Future<void> _syncLocale() async {
    if (!mounted || _syncing) return;
    _syncing = true;
    try {
      // Serialize loading, then recheck in case the platform changed meanwhile.
      while (true) {
        if (!mounted) return;
        final locale = _resolveLocale();
        if (context.locale == locale) break;
        await context.setLocale(locale);
      }
    } finally {
      _syncing = false;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
