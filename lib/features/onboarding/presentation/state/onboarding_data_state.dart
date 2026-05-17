import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/common/models/days_and_time_picker_model.dart';
import '../../data/models/onboarding_data_model.dart';

part 'onboarding_data_state.g.dart';

@Riverpod(keepAlive: true)
class OnboardingDataState extends _$OnboardingDataState {
  @override
  OnboardingDataModel build() {
    return OnboardingDataModel.initial();
  }

  void setExcuses(List<String> excuses) {
    state = state.copyWith(excuses: excuses);
    debugPrint('excuses: ${state.excuses}');
  }

  void setGoals(List<String> goals) {
    state = state.copyWith(goals: goals);
    debugPrint('goals: ${state.goals}');
  }

  void setStyleAndEquipment(String style, String equipment) {
    state = state.copyWith(workoutStyle: style, workoutEquipment: equipment);
    debugPrint('style: ${state.workoutStyle}, equipment: ${state.equipment}');
  }

  DaysAndTimePickerModel getDaysAndTime() {
    return DaysAndTimePickerModel(
      selectedDays: state.days,
      selectedTime: state.selectedTimeConverted,
    );
  }

  void setDaysAndTime(DaysAndTimePickerModel daysAndTime) {
    state = state.copyWith(
      days: daysAndTime.selectedDays,
      targetTime: daysAndTime.selectedTime,
    );
  }
}
