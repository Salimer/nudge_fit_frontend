import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/common/state/days_and_time_picker_state.dart';
import '../../../../core/common/widgets/days_and_time_picker_widget.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../use_cases/onboarding_use_case.dart';

class OnboardingThirdScreen extends ConsumerWidget {
  const OnboardingThirdScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDays = ref.watch(
      daysAndTimePickerStateProvider.select((state) => state.selectedDays),
    );
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: Spaces.vertical),
          child: Column(
            children: [
              NeutralMighty(),
              const SizedBox(height: Spaces.xxl),
              Text(
                context.l10n.whenAreWeDoingThis,
                textAlign: TextAlign.center,
                style: ShadTheme.of(context).textTheme.h2,
              ),
              const SizedBox(height: Spaces.xl),

              // Days Selector
              DaysAndTimePickerWidget(),
              const SizedBox(height: Spaces.xl),

              Padding(
                padding: const EdgeInsets.all(Spaces.horizontal),
                child: SizedBox(
                  width: double.infinity,
                  child: ShadButton(
                    enabled: selectedDays.isNotEmpty,
                    onPressed: () {
                      ref
                          .read(onboardingUseCaseProvider)
                          .leaveThirdOnboardingScreen();
                    },
                    child: Text(context.l10n.next),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
