import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';

class OnboardingDataModel {
  final List<String> excuses;
  final List<String> goals;
  final String? workoutStyle;
  final String? equipment;
  final List<String> days;
  final TimeOfDay targetTime;

  Time get selectedTimeConverted =>
      Time(hour: targetTime.hour, minute: targetTime.minute);

  OnboardingDataModel({
    required this.excuses,
    required this.goals,
    this.workoutStyle,
    this.equipment,
    required this.days,
    required this.targetTime,
  });

  factory OnboardingDataModel.initial() => OnboardingDataModel(
    excuses: [],
    goals: [],
    workoutStyle: null,
    equipment: null,
    days: [],
    targetTime: const TimeOfDay(hour: 08, minute: 00),
  );

  OnboardingDataModel copyWith({
    List<String>? excuses,
    List<String>? goals,
    String? workoutStyle,
    String? workoutEquipment,
    List<String>? days,
    TimeOfDay? targetTime,
  }) {
    return OnboardingDataModel(
      excuses: excuses ?? this.excuses,
      goals: goals ?? this.goals,
      workoutStyle: workoutStyle ?? this.workoutStyle,
      equipment: workoutEquipment ?? equipment,
      days: days ?? this.days,
      targetTime: targetTime ?? this.targetTime,
    );
  }

  Map<String, dynamic> toJson() => {
    'excuses': excuses,
    'goals': goals,
    'workout_style': workoutStyle,
    'equipment': equipment,
    'days': days,
    'target_time':
        '${targetTime.hour.toString().padLeft(2, '0')}:'
        '${targetTime.minute.toString().padLeft(2, '0')}',
  };
}
