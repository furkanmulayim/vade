import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/locale_keys.g.dart';
import '../models/due_date_status.dart';
import '../theme/palette_colors_extension.dart';

extension DueDateStatusPresentation on DueDateStatus {
  String label(BuildContext context) => switch (state) {
    DueDateState.expired => context.tr(LocaleKeys.due_expired),
    DueDateState.upcoming =>
      days == 0
          ? context.tr(LocaleKeys.due_last_day)
          : context.plural(LocaleKeys.due_days_left, days, name: 'count'),
    DueDateState.remaining => context.plural(
      LocaleKeys.due_months_left,
      months,
      name: 'count',
    ),
  };

  Color color(PaletteColorsExtension colors) => switch (progress) {
    >= 0.95 => colors.expired,
    >= 0.75 => colors.upcoming,
    _ => colors.relax,
  };

  Color backgroundColor(PaletteColorsExtension colors) => switch (progress) {
    >= 0.95 => colors.backExpired,
    >= 0.75 => colors.backUpcoming,
    _ => colors.backRelax,
  };
}
