import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/routes_state.dart';
import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../widgets/language_switch_widget.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      footer: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
        child: Consumer(
          builder: (context, ref, _) {
            return CustomElevatedButton1(
              text: context.l10n.getStarted,
              onPressed: () {
                ref.read(routesProvider).goNamed(RouteNames.onboardingSecond);
              },
            );
          },
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const LanguageSwitchWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const NeutralMighty(),
                        const SizedBox(height: 12),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              context.l10n.welcomeTo,
                              style: FTheme.of(context).typography.xl4.copyWith(
                                fontSize: 50,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              context.l10n.nudgeFit.toUpperCase(),
                              style: FTheme.of(context).typography.xl4.copyWith(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              context.l10n.weDoOnlyOneThing,
                              style: FTheme.of(context).typography.lg,
                            ),
                            Text(
                              context.l10n.makeSureYouShowUp,
                              style: FTheme.of(context).typography.xl.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        Text(
                          context.l10n.youHaveThePlanWeProvideTheDiscipline,
                          maxLines: 2,
                          style: FTheme.of(context).typography.lg,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
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
