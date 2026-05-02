import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/spaces.dart';
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
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NeutralMighty(),
              const SizedBox(height: Spaces.md),
              Text(
                context.l10n.whenAreWeDoingThis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Spaces.xl),

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
            padding: const EdgeInsets.only(
              left: Spaces.lg,
              right: Spaces.lg,
              bottom: Spaces.xl,
            ),
            child: PrimaryButton(
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
