import 'package:flutter/material.dart';
import 'package:nudge_fit_frontend/core/common/models/days_and_time_picker_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/onboarding_data_model.dart';

part 'onboarding_data_state.g.dart';

@Riverpod(keepAlive: true)
class OnboardingDataState extends _$OnboardingDataState {
  @override
  OnboardingDataModel build() {
    return OnboardingDataModel.initial();
  }

  void setExcuses(List<String> excuses) {
    state = state.copyWith(selectedExcuses: excuses);
    debugPrint('excuses: ${state.selectedExcuses}');
  }

  DaysAndTimePickerModel getDaysAndTime() {
    return DaysAndTimePickerModel(
      selectedDays: state.selectedDays,
      selectedTime: state.selectedTimeConverted,
    );
  }

  void setDaysAndTime(DaysAndTimePickerModel daysAndTime) {
    state = state.copyWith(
      selectedDays: daysAndTime.selectedDays,
      selectedTime: daysAndTime.selectedTime,
    );
  }
}
