import 'package:flutter_test/flutter_test.dart';
import 'package:vade/core/models/due_date_status.dart';
import 'package:vade/core/extensions/due_date_status_extension.dart';
import 'package:vade/core/theme/app_theme.dart';
import 'package:vade/core/theme/palette_colors_extension.dart';

void main() {
  test('68 percent fills 68 percent; colors switch at 75 and 95 percent', () {
    final start = DateTime(2026, 1, 1);
    final end = start.add(const Duration(days: 100));
    for (final theme in [AppTheme.light, AppTheme.dark]) {
      final colors = theme.extension<PaletteColorsExtension>()!;
      for (final day in [0, 68, 70, 74, 75, 94, 95, 100]) {
        final status = DueDateStatus.calculate(
          end,
          startDate: start,
          now: start.add(Duration(days: day)),
        );
        expect(status.progress, day / 100);
        expect(
          status.color(colors),
          day >= 95
              ? colors.expired
              : day >= 75
              ? colors.upcoming
              : colors.relax,
        );
        expect(
          status.backgroundColor(colors),
          day >= 95
              ? colors.backExpired
              : day >= 75
              ? colors.backUpcoming
              : colors.backRelax,
        );
      }
    }
  });
  group('Date range progress', () {
    final start = DateTime(2026, 1, 1);
    final end = DateTime(2026, 1, 11);

    test('tracks elapsed portion and clamps outside the range', () {
      for (final (date, expected) in [
        (DateTime(2025, 12, 31), 0.0),
        (start, 0.0),
        (DateTime(2026, 1, 6), 0.5),
        (end, 1.0),
        (DateTime(2026, 1, 12), 1.0),
      ]) {
        expect(
          DueDateStatus.calculate(end, startDate: start, now: date).progress,
          expected,
        );
      }
    });

    test('uses calendar days regardless of time of day', () {
      expect(
        DueDateStatus.calculate(
          DateTime(2026, 1, 11, 23),
          startDate: DateTime(2026, 1, 1, 18),
          now: DateTime(2026, 1, 6, 3),
        ).progress,
        0.5,
      );
    });

    test('handles same-day and reversed ranges without division by zero', () {
      for (final rangeStart in [end, DateTime(2026, 1, 12)]) {
        expect(
          DueDateStatus.calculate(
            end,
            startDate: rangeStart,
            now: start,
          ).progress,
          0.0,
        );
        expect(
          DueDateStatus.calculate(
            end,
            startDate: rangeStart,
            now: end,
          ).progress,
          1.0,
        );
      }
    });
  });
}
