import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Tema uzantılarına widget ağacının her yerinden kısa erişim sağlar.
extension ContextExtension on BuildContext {
  AppColors get color => Theme.of(this).extension<AppColors>()!;
}
