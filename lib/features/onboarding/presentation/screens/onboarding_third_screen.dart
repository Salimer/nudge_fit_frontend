import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import '../../../../core/common/state/days_and_time_picker_state.dart';
import '../../../../core/common/widgets/days_and_time_picker_widget.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../use_cases/onboarding_use_case.dart';

class OnboardingThirdScreen extends ConsumerWidget {
  const OnboardingThirdScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FScaffold(
      header: const FHeader(title: Text('')),
      footer: Consumer(
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
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NeutralMighty(),
              const SizedBox(height: 16),
              Text(
                context.l10n.whenAreWeDoingThis,
                textAlign: TextAlign.center,
                style: FTheme.of(context).typography.xl3.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),

              // Days Selector
              const DaysAndTimePickerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
