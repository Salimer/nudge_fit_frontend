class DayInWeekModel {
  DayInWeekModel({
    required this.dayKey,
    required this.dayName,
    this.isSelected = false,
  });

  /// `dayKey` Property to hold the key of the day.
  final String dayKey;

  /// `dayName` Property to hold the name of the day.
  final String dayName;

  /// `isSelected` Property to hold the state of the day.
  bool isSelected;

  /// Toggle the boolean `isSelected` to `true` or `false`.
  void toggleIsSelected() => isSelected = !isSelected;
}
