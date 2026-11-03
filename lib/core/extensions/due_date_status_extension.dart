import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/locale_keys.g.dart';
import '../models/due_date_status.dart';
import '../theme/palette_colors_extension.dart';

extension DueDateStatusPresentation on DueDateStatus {
  String label() => switch (state) {
    DueDateState.expired => LocaleKeys.due_expired.tr(),
    DueDateState.upcoming =>
      days == 0
          ? LocaleKeys.due_last_day.tr()
          : LocaleKeys.due_days_left.plural(days, name: 'count'),
    DueDateState.remaining => LocaleKeys.due_months_left.plural(
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
