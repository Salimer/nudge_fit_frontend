import 'package:flutter/material.dart';
import 'package:nudge_fit_frontend/core/common/state/days_and_time_picker_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/extensions/build_context.dart';
import '../../../core/common/state/routes_state.dart';
import '../presentation/state/onboarding_data_state.dart';

part 'onboarding_use_case.g.dart';

@Riverpod(keepAlive: true)
OnboardingUseCase onboardingUseCase(Ref ref) => OnboardingUseCase(ref);

class OnboardingUseCase {
  OnboardingUseCase(this.ref);
  final Ref ref;

  void leaveSecondOnboardingScreen(List<String> excuses) {
    ref.read(onboardingDataStateProvider.notifier).setExcuses(excuses);
    syncSelectedDaysAndTimeWidget();
    ref.read(routesProvider).goNamed(RouteNames.onboardingThird);
  }

  void leaveThirdOnboardingScreen() {
    syncSelectedDaysAndTimeToOnboardingState();
    ref.read(routesProvider).goNamed(RouteNames.onboardingFourth);
  }

  void leaveFifthOnboardingScreen() {
    ref.read(routesProvider).goNamed(RouteNames.onboardingSixth);
  }

  List<String> getLocalizedSelectedDays(BuildContext context) {
    final days = ref.read(onboardingDataStateProvider).selectedDays;
    return days.map((day) {
      switch (day) {
        case "Saturday":
          return context.l10n.saturday;
        case "Sunday":
          return context.l10n.sunday;
        case "Monday":
          return context.l10n.monday;
        case "Tuesday":
          return context.l10n.tuesday;
        case "Wednesday":
          return context.l10n.wednesday;
        case "Thursday":
          return context.l10n.thursday;
        case "Friday":
          return context.l10n.friday;
        default:
          return day;
      }
    }).toList();
  }

  void syncSelectedDaysAndTimeToOnboardingState() {
    final selectedDaysAndTime = ref.read(daysAndTimePickerStateProvider);

    ref
        .read(onboardingDataStateProvider.notifier)
        .setDaysAndTime(selectedDaysAndTime);
  }

  void syncSelectedDaysAndTimeWidget() {
    final onboardingDaysAndTime = ref
        .read(onboardingDataStateProvider.notifier)
        .getDaysAndTime();

    ref
        .read(daysAndTimePickerStateProvider.notifier)
        .setDaysAndTime(onboardingDaysAndTime);
  }
}
