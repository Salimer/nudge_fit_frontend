import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/routes_state.dart';
import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../widgets/language_switch_widget.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spaces.sm),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .max,
            children: [
              LanguageSwitchWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: .min,
                      children: [
                        NeutralMighty(),
                        SizedBox(height: Spaces.md),
                        Column(
                          mainAxisSize: .min,
                          children: [
                            Text(
                              context.l10n.welcomeTo,
                              style: ShadTheme.of(context).textTheme.h1,
                            ),
                            SizedBox(height: Spaces.sm),
                            Text(
                              context.l10n.nudgeFit.toUpperCase(),
                              style: ShadTheme.of(context).textTheme.h1Large,
                            ),
                          ],
                        ),
                        SizedBox(height: Spaces.md),

                        Column(
                          mainAxisSize: .min,
                          children: [
                            Text(
                              context.l10n.weDoOnlyOneThing,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              context.l10n.makeSureYouShowUp,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: Spaces.md),

                        Text(
                          context.l10n.youHaveThePlanWeProvideTheDiscipline,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: .center,
                        ),
                        SizedBox(height: Spaces.md),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: Spaces.lg,
          right: Spaces.lg,
          bottom: Spaces.xl,
        ),
        child: SafeArea(
          bottom: false,
          top: false,
          child: Consumer(
            builder: (context, ref, _) {
              return PrimaryButton(
                text: context.l10n.getStarted,
                onPressed: () {
                  ref.read(routesProvider).goNamed(RouteNames.onboardingSecond);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
