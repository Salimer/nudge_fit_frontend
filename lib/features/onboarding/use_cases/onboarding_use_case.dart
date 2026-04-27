import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/extensions/build_context.dart';
import '../../../core/state/go_router_state.dart';
import '../presentation/state/onboarding_data_state.dart';

part 'onboarding_use_case.g.dart';

@Riverpod(keepAlive: true)
OnboardingUseCase onboardingUseCase(Ref ref) => OnboardingUseCase(ref);

class OnboardingUseCase {
  OnboardingUseCase(this.ref);
  final Ref ref;

  void leaveSecondOnboardingScreen(List<String> excuses) {
    ref.read(onboardingDataStateProvider.notifier).setExcuses(excuses);
    ref.read(routesProvider).goNamed(RouteNames.onboardingThird);
  }

  void leaveThirdOnboardingScreen(List<String> days, TimeOfDay time) {
    ref.read(onboardingDataStateProvider.notifier).setDays(days);
    ref.read(onboardingDataStateProvider.notifier).setTime(time);
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
}
