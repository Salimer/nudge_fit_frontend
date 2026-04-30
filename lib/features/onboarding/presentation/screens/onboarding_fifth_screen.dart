import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/routes_state.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../use_cases/onboarding_use_case.dart';
import '../state/onboarding_data_state.dart';
import '../widgets/hold_confirm_btn.dart';

class OnboardingFifthScreen extends StatelessWidget {
  const OnboardingFifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: const FHeader(title: Text('')),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const FlexMighty(),
                Text(
                  context.l10n.commitmentTitle,
                  style: FTheme.of(context).typography.xl4.copyWith(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
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
                      style: FTheme.of(context).typography.xl.copyWith(
                        // fontSize: 25,
                        // fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
                const SizedBox(height: 20),
                Consumer(
                  builder: (context, ref, _) {
                    return HoldToConfirmButton(
                      onConfirm: () {
                        debugPrint("Action Triggered!");
                        // Logic for next screen or snackbar here
                        ref
                            .read(routesProvider)
                            .goNamed(RouteNames.onboardingSixth);
                      },
                      child: Text(
                        context.l10n.holdToSeal,
                        style: FTheme.of(context).typography.xl.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
