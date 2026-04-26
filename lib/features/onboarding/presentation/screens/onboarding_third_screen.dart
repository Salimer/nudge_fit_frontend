import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/mighty_onboarding.dart';
import '../../data/models/day_in_week_model.dart';
import '../../use_cases/onboarding_use_case.dart';
import '../state/onboarding_data_state.dart';
import '../widgets/select_week_days.dart';

class OnboardingThirdScreen extends ConsumerStatefulWidget {
  const OnboardingThirdScreen({super.key});

  @override
  ConsumerState<OnboardingThirdScreen> createState() =>
      _OnboardingThirdScreenState();
}

class _OnboardingThirdScreenState extends ConsumerState<OnboardingThirdScreen> {
  late Time _time;
  late List<String> _selectedDays;

  @override
  void initState() {
    super.initState();
    _selectedDays = ref.read(onboardingDataStateProvider).selectedDays;
    _time = ref.read(onboardingDataStateProvider).selectedTimeConverted;
  }

  void _showTimePicker() {
    Navigator.of(context).push(
      showPicker(
        themeData: Theme.of(context),
        okStyle: Theme.of(
          context,
        ).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w900),
        cancelStyle: Theme.of(
          context,
        ).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w900),
        focusMinutePicker: true,
        iosStylePicker: true,
        blurredBackground: true,
        context: context,
        value: _time,
        hourLabel: context.l10n.hours,
        minuteLabel: context.l10n.minutes,
        amLabel: context.l10n.amLabel,
        pmLabel: context.l10n.pmLabel,
        cancelText: context.l10n.cancel,
        okText: context.l10n.ok,
        duskSpanInMinutes: 120,
        onChange: (Time value) {
          setState(() {
            _time = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n;

    // Formatting the time for display (e.g., 08:30 AM)
    final hour = _time.hourOfPeriod.toString().padLeft(2, '0');
    final minute = _time.minute.toString().padLeft(2, '0');
    final period = _time.period == DayPeriod.am
        ? locale.amLabel
        : locale.pmLabel;

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

    List<String> selectedDays = ref
        .read(onboardingDataStateProvider)
        .selectedDays;

    List<DayInWeekModel> actualDays = days.map((day) {
      return day.copyWith(isSelected: selectedDays.contains(day.dayKey));
    }).toList();

    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NeutralMighty(),
              const SizedBox(height: 16),
              Text(
                context.l10n.whenAreWeDoingThis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),

              // Days Selector
              SelectWeekDays(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                days: actualDays,
                border: false,
                onSelect: (List<String> values) {
                  setState(() {
                    _selectedDays = values;
                  });
                },
              ),

              const SizedBox(height: 40),

              // THE NEW VISUAL TIME PICKER GESTURE DETECTOR
              GestureDetector(
                onTap: _showTimePicker,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primaryContainer.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "$hour:$minute",
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      Text(
                        period.toUpperCase(),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            "Tap to change", // You can add this to your l10n
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
            child: CustomButton1(
              text: context.l10n.next,
              onPressed: _selectedDays.isNotEmpty
                  ? () {
                      ref
                          .read(onboardingUseCaseProvider)
                          .leaveThirdOnboardingScreen(_selectedDays, _time);
                    }
                  : null,
            ),
          );
        },
      ),
    );
  }
}
