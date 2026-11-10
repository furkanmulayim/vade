import 'package:flutter/material.dart';

import '../theme/colors/app_colors_extension.dart';
import '../theme/typography/app_text_styles.dart';

/// Tema uzantılarına widget ağacının her yerinden kısa erişim sağlar.
extension ContextExtension on BuildContext {
  AppTextStyles get typo => AppTextStyles(color);
  AppColorsExtension get color =>
      Theme.of(this).extension<AppColorsExtension>()!;
}
