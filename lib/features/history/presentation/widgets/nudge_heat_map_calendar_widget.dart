import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../screens/history_screen.dart';

// Import your Spaces and LogEntry models here
// import 'spaces.dart';
// import 'history_screen.dart';

class NudgeHeatmapCalendar extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final Map<DateTime, LogEntry> historyLog;

  const NudgeHeatmapCalendar({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    required this.historyLog,
  });

  @override
  State<NudgeHeatmapCalendar> createState() => _NudgeHeatmapCalendarState();
}

class _NudgeHeatmapCalendarState extends State<NudgeHeatmapCalendar> {
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime(
      widget.selectedDate.year,
      widget.selectedDate.month,
      1,
    );
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    });
  }

  int get _daysInMonth =>
      DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;

  // 1 = Monday, 7 = Sunday. We offset so Monday is index 0.
  int get _firstWeekdayOffset =>
      DateTime(_currentMonth.year, _currentMonth.month, 1).weekday - 1;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    // Localized Headers
    final List<String> weekdays = isArabic
        ? ['ن', 'ث', 'ر', 'خ', 'ج', 'س', 'ح'] // Mon -> Sun shorthand
        : ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    // Standard intl date formatting for the month/year header
    final String monthName = isArabic
        ? DateFormat('MMMM yyyy', 'ar').format(_currentMonth)
        : DateFormat('MMMM yyyy', 'en').format(_currentMonth);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.card,
        borderRadius: BorderRadius.circular(24.0), // Spaces.lg
        border: Border.all(color: theme.colorScheme.border),
      ),
      padding: const EdgeInsets.all(16.0), // Spaces.md
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // --- HEADER: Month/Year & Navigation ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  LucideIcons.chevronLeft,
                  color: theme.colorScheme.foreground,
                ),
                onPressed: _previousMonth,
              ),
              Text(
                monthName,
                style: TextStyle(
                  color: theme.colorScheme.foreground,
                  fontSize: 16.0, // Spaces.md
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(
                  LucideIcons.chevronRight,
                  color: theme.colorScheme.foreground,
                ),
                onPressed: _nextMonth,
              ),
            ],
          ),
          const SizedBox(height: 16.0), // Spaces.md
          // --- WEEKDAYS ROW ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: weekdays
                .map(
                  (day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: TextStyle(
                          color: theme.colorScheme.mutedForeground,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 8.0), // Spaces.sm
          // --- CALENDAR GRID ---
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _daysInMonth + _firstWeekdayOffset,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0, // Spaces.sm
              crossAxisSpacing: 8.0, // Spaces.sm
            ),
            itemBuilder: (context, index) {
              if (index < _firstWeekdayOffset) {
                return const SizedBox.shrink(); // Empty slots before the 1st
              }

              final int dayNumber = index - _firstWeekdayOffset + 1;
              final DateTime cellDate = DateTime(
                _currentMonth.year,
                _currentMonth.month,
                dayNumber,
              );

              final bool isSelected =
                  cellDate.year == widget.selectedDate.year &&
                  cellDate.month == widget.selectedDate.month &&
                  cellDate.day == widget.selectedDate.day;

              // Check history log for this specific date
              final LogEntry? log = widget.historyLog[cellDate];

              return GestureDetector(
                onTap: () => widget.onDateSelected(cellDate),
                child: _buildDayCell(
                  dayNumber: dayNumber,
                  isSelected: isSelected,
                  log: log,
                  theme: theme,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDayCell({
    required int dayNumber,
    required bool isSelected,
    required LogEntry? log,
    required ShadThemeData theme,
  }) {
    Color? dotColor;
    if (log != null) {
      dotColor = log.conquered
          ? theme.colorScheme.primary
          : theme.colorScheme.destructive;
    }

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? theme.colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0), // Spaces.sm
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            '$dayNumber',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: isSelected || log != null
                  ? FontWeight.w700
                  : FontWeight.w500,
              color: isSelected
                  ? theme.colorScheme.primaryForeground
                  : theme.colorScheme.foreground,
            ),
          ),

          // The Heatmap Dot
          if (dotColor != null)
            Positioned(
              bottom: 4,
              child: Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: isSelected
                      ? theme.colorScheme.primaryForeground
                      : dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
