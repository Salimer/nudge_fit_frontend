import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/common/state/days_and_time_picker_state.dart';
import '../../../core/common/state/routes_state.dart';
import '../../../core/utils/get_localized_day.dart';
import '../data/repositories/onboarding_repository.dart';
import '../presentation/state/onboarding_data_state.dart';

part 'onboarding_use_case.g.dart';

@Riverpod(keepAlive: true)
OnboardingUseCase onboardingUseCase(Ref ref) => OnboardingUseCase(ref);

class OnboardingUseCase {
  OnboardingUseCase(this.ref);
  final Ref ref;

  OnboardingRepository get repo => ref.read(onboardingRepoProvider);

  void leaveSecondOnboardingScreen(List<String> excuses) {
    ref.read(onboardingDataStateProvider.notifier).setExcuses(excuses);
    syncSelectedDaysAndTimeWidget();
    ref.read(routesProvider).goNamed(RouteNames.onboarding3Contract);
  }

  void leaveThirdOnboardingScreen() {
    syncSelectedDaysAndTimeToOnboardingState();
    ref.read(routesProvider).goNamed(RouteNames.onboarding4goals);
  }

  void leaveFourthOnboardingScreen(List<String> goals) {
    ref.read(onboardingDataStateProvider.notifier).setGoals(goals);
    ref.read(routesProvider).goNamed(RouteNames.onboarding5Battlefield);
  }

  void leaveFifthOnboardingScreen(String style, String equipment) {
    ref
        .read(onboardingDataStateProvider.notifier)
        .setStyleAndEquipment(style, equipment);
    ref.read(routesProvider).goNamed(RouteNames.onboarding6NotReq);
  }

  List<String> getLocalizedSelectedDays(BuildContext context) {
    final days = ref.read(onboardingDataStateProvider).days;
    days.map((e) => debugPrint('selected day $e'));
    return getLocalizedDays(ref, days);
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

  Future<void> onboard() async {
    await repo.onboard();
  }
}

final Mutation onboardMutation = Mutation<void>(label: 'onboard');
