import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../features/onboarding/data/models/day_in_week_model.dart';
import '../../../features/onboarding/presentation/widgets/select_week_days.dart';
import '../../extensions/build_context.dart';
import '../state/days_and_time_picker_state.dart';
import '../../constants/spaces.dart';

class DaysAndTimePickerWidget extends ConsumerWidget {
  const DaysAndTimePickerWidget({super.key});

  void _showTimePicker(BuildContext context, WidgetRef ref, Time time) {
    Navigator.of(context).push(
      showPicker(
        backgroundColor: ShadTheme.of(context).colorScheme.accent,
        accentColor: ShadTheme.of(context).colorScheme.accentForeground,
        okStyle: ShadTheme.of(context).textTheme.small,
        cancelStyle: ShadTheme.of(context).textTheme.small,
        iosStylePicker: true,
        blurredBackground: true,
        context: context,
        value: time,
        hourLabel: context.l10n.hours,
        minuteLabel: context.l10n.minutes,
        amLabel: context.l10n.amLabel,
        pmLabel: context.l10n.pmLabel,
        cancelText: context.l10n.cancel,
        okText: context.l10n.ok,
        duskSpanInMinutes: 120,
        onChange: (Time value) {
          // Vibrate when the time is confirmed/changed
          HapticFeedback.mediumImpact();
          ref.read(daysAndTimePickerStateProvider.notifier).setTime(value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(daysAndTimePickerStateProvider, ((_, _) {}));
    final locale = context.l10n;
    final time = ref.watch(
      daysAndTimePickerStateProvider.select((state) => state.selectedTime),
    );

    // Formatting the time for display (e.g., 08:30 AM)
    final hour = time.hourOfPeriod.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am
        ? locale.amLabel
        : locale.pmLabel;

    List<DayInWeekModel> days = [
      DayInWeekModel(
        dayName: locale.saturday,
        dayKey: 'Saturday',
        isSelected: true,
      ),
      DayInWeekModel(
        dayName: locale.sunday,
        dayKey: 'Sunday',
        isSelected: true,
      ),
      DayInWeekModel(dayName: locale.monday, dayKey: 'Monday'),
      DayInWeekModel(dayName: locale.tuesday, dayKey: 'Tuesday'),
      DayInWeekModel(dayName: locale.wednesday, dayKey: 'Wednesday'),
      DayInWeekModel(dayName: locale.thursday, dayKey: 'Thursday'),
      DayInWeekModel(dayName: locale.friday, dayKey: 'Friday'),
    ];

    List<String> selectedDays = ref.watch(
      daysAndTimePickerStateProvider.select((state) => state.selectedDays),
    );

    List<DayInWeekModel> actualDays = days.map((day) {
      return day.copyWith(isSelected: selectedDays.contains(day.dayKey));
    }).toList();
    return Column(
      children: [
        // Days Selector
        SelectWeekDays(
          backgroundColor: ShadTheme.of(context).colorScheme.primary,
          selectedDayTextColor: ShadTheme.of(context).colorScheme.primary,
          selectedDaysFillColor: ShadTheme.of(context).colorScheme.secondary,
          unSelectedDayTextColor: ShadTheme.of(context).colorScheme.secondary,
          fontSize: 10,
          fontWeight: FontWeight.w900,
          days: actualDays,
          border: false,
          onSelect: (List<String> values) {
            // Vibrate when a day is selected/toggled
            HapticFeedback.lightImpact();
            ref.read(daysAndTimePickerStateProvider.notifier).setDays(values);
          },
        ),
        const SizedBox(height: Spaces.xxl),

        // THE NEW VISUAL TIME PICKER GESTURE DETECTOR
        GestureDetector(
          onTap: () {
            // Optional: Vibrate when opening the picker
            HapticFeedback.selectionClick();
            _showTimePicker(context, ref, time);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Spaces.lg,
              horizontal: Spaces.xxl,
            ),
            decoration: BoxDecoration(
              color: ShadTheme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: ShadTheme.of(
                  context,
                ).colorScheme.secondary.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              children: [
                Text(
                  '$hour:$minute',
                  style: ShadTheme.of(context).textTheme.h1Large,
                ),
                Text(
                  period.toUpperCase(),
                  style: ShadTheme.of(context).textTheme.h4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
