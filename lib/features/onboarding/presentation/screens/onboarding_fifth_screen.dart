import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Spaces.all),
            child: Column(
              children: [
                const FlexMighty(),
                const SizedBox(height: Spaces.xxl),
                Text(
                  context.l10n.commitmentTitle,
                  style: ShadTheme.of(context).textTheme.h1Large,
                  textAlign: .center,
                ),
                const SizedBox(height: Spaces.lg),
                Consumer(
                  builder: (context, ref, _) {
                    final selectedDays = ref
                        .read(onboardingUseCaseProvider)
                        .getLocalizedSelectedDays(context);
                    final selectedTime = ref
                        .read(onboardingDataStateProvider)
                        .selectedTime;

                    return Text(
                      '${selectedDays.map((e) => e)} ${context.l10n.at} ${selectedTime.format(context)}',
                      style: ShadTheme.of(context).textTheme.h4,
                      textAlign: .center,
                    );
                  },
                ),
                const SizedBox(height: Spaces.lg),
                Consumer(
                  builder: (context, ref, _) {
                    return HoldToConfirmButton(
                      onConfirm: () {
                        debugPrint('Action Triggered!');
                        // Logic for next screen or snackbar here
                        ref
                            .read(routesProvider)
                            .goNamed(RouteNames.onboardingSixth);
                      },
                      child: Text(
                        context.l10n.holdToSeal,
                        style: ShadTheme.of(context).textTheme.h3,
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
