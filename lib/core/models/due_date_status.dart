enum DueDateState { expired, upcoming, remaining }

/// Calendar-based remaining time, independent of time of day and DST changes.
class DueDateStatus {
  const DueDateStatus._({
    required this.days,
    required this.months,
    required this.state,
    required this.progress,
  });

  factory DueDateStatus.calculate(DateTime dueDate, {DateTime? now}) {
    final current = now ?? DateTime.now();
    final today = DateTime.utc(current.year, current.month, current.day);
    final due = DateTime.utc(dueDate.year, dueDate.month, dueDate.day);
    final days = due.difference(today).inDays;
    final progress = (1 - days / 250).clamp(0.05, 1.0);

    if (days < 0) {
      return DueDateStatus._(
        days: days,
        months: 0,
        state: DueDateState.expired,
        progress: progress,
      );
    }

    var months = (due.year - today.year) * 12 + due.month - today.month;
    final lastDay = DateTime.utc(today.year, today.month + months + 1, 0).day;
    final anniversary = DateTime.utc(
      today.year,
      today.month + months,
      today.day > lastDay ? lastDay : today.day,
    );
    if (anniversary.isAfter(due)) months--;

    return DueDateStatus._(
      days: days,
      months: months,
      state: months < 1 ? DueDateState.upcoming : DueDateState.remaining,
      progress: progress,
    );
  }

  final int days;
  final int months;
  final DueDateState state;

  final double progress;
}
