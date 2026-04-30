import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:forui/forui.dart';

import '../../../features/onboarding/data/models/day_in_week_model.dart';
import '../../../features/onboarding/presentation/widgets/select_week_days.dart';
import '../../extensions/build_context.dart';
import '../state/days_and_time_picker_state.dart';

class DaysAndTimePickerWidget extends ConsumerWidget {
  const DaysAndTimePickerWidget({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(daysAndTimePickerStateProvider, ((_, _) {}));
    final locale = context.l10n;
    final time = ref.watch(
      daysAndTimePickerStateProvider.select((state) => state.selectedTime),
    );



    List<DayInWeekModel> days = [
      DayInWeekModel(
        dayName: locale.saturday,
        dayKey: "Saturday",
        isSelected: true,
      ),
      DayInWeekModel(
        dayName: locale.sunday,
        dayKey: "Sunday",
        isSelected: true,
      ),
      DayInWeekModel(dayName: locale.monday, dayKey: "Monday"),
      DayInWeekModel(dayName: locale.tuesday, dayKey: "Tuesday"),
      DayInWeekModel(dayName: locale.wednesday, dayKey: "Wednesday"),
      DayInWeekModel(dayName: locale.thursday, dayKey: "Thursday"),
      DayInWeekModel(dayName: locale.friday, dayKey: "Friday"),
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
          fontSize: 12,
          fontWeight: FontWeight.w900,
          days: actualDays,
          border: false,
          onSelect: (List<String> values) {
            ref.read(daysAndTimePickerStateProvider.notifier).setDays(values);
          },
        ),
        const SizedBox(height: 40),

        SizedBox(
          height: 400,
          child: FTimePicker(
            control: FTimePickerControl.lifted(
              time: FTime(time.hour, time.minute),
              onChange: (fTime) => ref.read(daysAndTimePickerStateProvider.notifier).setTime(
                    Time(hour: fTime.hour, minute: fTime.minute),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
