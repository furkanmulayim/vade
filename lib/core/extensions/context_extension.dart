import 'package:flutter/material.dart';

import '../theme/palette_colors_extension.dart';
import '../theme/text_styles.dart';

/// Tema uzantılarına widget ağacının her yerinden kısa erişim sağlar.
extension ContextExtension on BuildContext {
  TextStyles get typo => TextStyles(color);
  PaletteColorsExtension get color =>
      Theme.of(this).extension<PaletteColorsExtension>()!;
}
