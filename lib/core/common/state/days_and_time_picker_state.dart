import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/days_and_time_picker_model.dart';

part 'days_and_time_picker_state.g.dart';

@riverpod
class DaysAndTimePickerState extends _$DaysAndTimePickerState {
  @override
  DaysAndTimePickerModel build() => DaysAndTimePickerModel.initial();

  void setDays(List<String> days) {
    state = state.copyWith(selectedDays: days);
  }

  void setTime(Time time) {
    state = state.copyWith(selectedTime: time);
  }

  void setDaysAndTime(DaysAndTimePickerModel daysAndTime) {
    state = daysAndTime;
  }
}
