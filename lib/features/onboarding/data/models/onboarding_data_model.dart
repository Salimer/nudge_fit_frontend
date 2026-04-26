import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';

class OnboardingDataModel {
  final List<String> selectedExcuses;
  final List<String> selectedDays;
  final TimeOfDay selectedTime;

  Time get selectedTimeConverted =>
      Time(hour: selectedTime.hour, minute: selectedTime.minute);

  OnboardingDataModel({
    required this.selectedExcuses,
    required this.selectedDays,
    required this.selectedTime,
  });

  factory OnboardingDataModel.initial() => OnboardingDataModel(
    selectedExcuses: [],
    selectedDays: [],
    selectedTime: TimeOfDay(hour: 08, minute: 00),
  );

  OnboardingDataModel copyWith({
    List<String>? selectedExcuses,
    List<String>? selectedDays,
    TimeOfDay? selectedTime,
  }) {
    return OnboardingDataModel(
      selectedExcuses: selectedExcuses ?? this.selectedExcuses,
      selectedDays: selectedDays ?? this.selectedDays,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}
