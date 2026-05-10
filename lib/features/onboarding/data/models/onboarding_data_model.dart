import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';

class OnboardingDataModel {
  final List<String> selectedExcuses;
  final List<String> selectedGoals;
  final String? selectedStyle;
  final String? selectedEquipment;
  final List<String> selectedDays;
  final TimeOfDay selectedTime;

  Time get selectedTimeConverted =>
      Time(hour: selectedTime.hour, minute: selectedTime.minute);

  OnboardingDataModel({
    required this.selectedExcuses,
    required this.selectedGoals,
    this.selectedStyle,
    this.selectedEquipment,
    required this.selectedDays,
    required this.selectedTime,
  });

  factory OnboardingDataModel.initial() => OnboardingDataModel(
    selectedExcuses: [],
    selectedGoals: [],
    selectedStyle: null,
    selectedEquipment: null,
    selectedDays: [],
    selectedTime: const TimeOfDay(hour: 08, minute: 00),
  );

  OnboardingDataModel copyWith({
    List<String>? selectedExcuses,
    List<String>? selectedGoals,
    String? selectedStyle,
    String? selectedEquipment,
    List<String>? selectedDays,
    TimeOfDay? selectedTime,
  }) {
    return OnboardingDataModel(
      selectedExcuses: selectedExcuses ?? this.selectedExcuses,
      selectedGoals: selectedGoals ?? this.selectedGoals,
      selectedStyle: selectedStyle ?? this.selectedStyle,
      selectedEquipment: selectedEquipment ?? this.selectedEquipment,
      selectedDays: selectedDays ?? this.selectedDays,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}
