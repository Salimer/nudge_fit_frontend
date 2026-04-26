import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nudge_fit_frontend/core/extensions/build_context.dart';
import 'package:nudge_fit_frontend/core/widgets/mighty_onboarding.dart';
import 'package:nudge_fit_frontend/features/onboarding/presentation/state/onboarding_data_state.dart';
import 'package:nudge_fit_frontend/features/onboarding/use_cases/onboarding_use_case.dart';

import '../widgets/hold_confirm_btn.dart';

class OnboardingFifthScreen extends StatelessWidget {
  const OnboardingFifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              FlexMighty(),
              Text(
                context.l10n.commitmentTitle,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: .center,
              ),
              SizedBox(height: 20),
              Consumer(
                builder: (context, ref, _) {
                  final selectedDays = ref
                      .read(onboardingUseCaseProvider)
                      .getLocalizedSelectedDays(context);
                  final selectedTime = ref
                      .read(onboardingDataStateProvider)
                      .selectedTime;

                  return Text(
                    "${selectedDays.map((e) => e.toUpperCase())} ${context.l10n.at} ${selectedTime.format(context)}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: .center,
                  );
                },
              ),
              SizedBox(height: 20),
              Expanded(
                child: HoldToConfirmButton(
                  onConfirm: () {
                    debugPrint("Action Triggered!");
                    // Logic for next screen or snackbar here
                  },
                  child: Text(
                    context.l10n.holdToSeal,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
