import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/routes_state.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../widgets/language_switch_widget.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: Spaces.horizontal,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    const SizedBox(height: Spaces.xxxl),
                    NeutralMighty(),
                    SizedBox(height: Spaces.xxl),
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
                    const SizedBox(height: Spaces.md),

                    Column(
                      mainAxisSize: .min,
                      children: [
                        Text(
                          context.l10n.weDoOnlyOneThing,
                          style: ShadTheme.of(context).textTheme.h4,
                        ),
                        Text(
                          context.l10n.makeSureYouShowUp,
                          style: ShadTheme.of(context).textTheme.h2,
                        ),
                      ],
                    ),
                    SizedBox(height: Spaces.md),

                    Text(
                      context.l10n.youHaveThePlanWeProvideTheDiscipline,
                      maxLines: 2,
                      style: ShadTheme.of(context).textTheme.h4,
                      textAlign: .center,
                    ),
                    SizedBox(height: Spaces.xxl),
                    Consumer(
                      builder: (context, ref, _) {
                        return SizedBox(
                          width: double.infinity,
                          child: ShadButton(
                            child: Text(context.l10n.getStarted),
                            onPressed: () {
                              ref
                                  .read(routesProvider)
                                  .goNamed(RouteNames.onboardingSecond);
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: Spaces.lg),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spaces.horizontal,
                ),
                child: LanguageSwitchWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
