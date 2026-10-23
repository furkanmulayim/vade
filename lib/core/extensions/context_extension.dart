import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Tema uzantılarına widget ağacının her yerinden kısa erişim sağlar.
extension ContextExtension on BuildContext {
  AppTypography get typo => AppTypography(color);
  AppColors get color => Theme.of(this).extension<AppColors>()!;
}
