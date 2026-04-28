import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/state/days_and_time_picker_state.dart';
import '../../../../core/common/widgets/days_and_time_picker_widget.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/mighty_onboarding.dart';
import '../../use_cases/onboarding_use_case.dart';
import '../state/onboarding_data_state.dart';

class OnboardingThirdScreen extends ConsumerWidget {
  const OnboardingThirdScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref.read(onboardingUseCaseProvider).syncSelectedDaysAndTimeWidget();
    // });

    // ref.watch(daysAndTimePickerStateProvider);

    final onboardingDaysAndTime = ref
        .read(onboardingDataStateProvider.notifier)
        .getDaysAndTime();

    final widgetDaysAndTime = ref.read(daysAndTimePickerStateProvider);

    debugPrint(
      "onboarding date and time:\n${onboardingDaysAndTime.toString()}",
    );
    debugPrint("widget date and time:\n${widgetDaysAndTime.toString()}");

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
              DaysAndTimePickerWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) {
          final selectedDays = ref.watch(
            daysAndTimePickerStateProvider.select(
              (state) => state.selectedDays,
            ),
          );

          return Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
            child: CustomElevatedButton1(
              text: context.l10n.next,
              onPressed: selectedDays.isNotEmpty
                  ? () {
                      ref
                          .read(onboardingUseCaseProvider)
                          .leaveThirdOnboardingScreen();
                    }
                  : null,
            ),
          );
        },
      ),
    );
  }
}
