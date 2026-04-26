import 'package:flutter/material.dart';
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
    debugPrint("excuses: ${state.selectedExcuses}");
  }

  void setDays(List<String> days) {
    state = state.copyWith(selectedDays: days);
  }

  void setTime(TimeOfDay time) {
    state = state.copyWith(selectedTime: time);
  }
}
