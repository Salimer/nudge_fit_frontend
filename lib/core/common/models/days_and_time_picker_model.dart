import 'package:day_night_time_picker/lib/state/time.dart';

class DaysAndTimePickerModel {
  final List<String> selectedDays;
  final Time selectedTime;

  DaysAndTimePickerModel({
    required this.selectedDays,
    required this.selectedTime,
  });

  DaysAndTimePickerModel copyWith({
    List<String>? selectedDays,
    Time? selectedTime,
  }) {
    return DaysAndTimePickerModel(
      selectedDays: selectedDays ?? this.selectedDays,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }

  factory DaysAndTimePickerModel.initial() => DaysAndTimePickerModel(
    selectedDays: [],
    selectedTime: Time(hour: 08, minute: 00),
  );

  Map<String, dynamic> toJson() => {
    'days': selectedDays,
    'target_time':
        '${selectedTime.hour.toString().padLeft(2, '0')}:'
        '${selectedTime.minute.toString().padLeft(2, '0')}',
  };

  @override
  String toString() {
    return 'DaysAndTimePickerModel(selectedDays: $selectedDays, selectedTime: ${selectedTime.hour}:${selectedTime.minute})';
  }
}
