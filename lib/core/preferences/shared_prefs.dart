import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const _completedKey = 'onboarding_completed';

  Future<bool> get isOnboardingCompleted async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_completedKey) ?? false;
  }

  Future<void> completeOnboarding() async {
    final preferences = await SharedPreferences.getInstance();
    final saved = await preferences.setBool(_completedKey, true);
    if (!saved) throw StateError('Onboarding durumu kaydedilemedi.');
  }
}
