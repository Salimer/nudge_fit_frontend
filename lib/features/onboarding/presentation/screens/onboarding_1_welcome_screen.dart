import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/routes_state.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../state/onboarding_data_state.dart';
import '../widgets/language_switch_widget.dart';

class Onboarding1WelcomeScreen extends StatelessWidget {
  const Onboarding1WelcomeScreen({super.key});

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
                    const NeutralMighty(),
                    const SizedBox(height: Spaces.xxl),
                    Column(
                      mainAxisSize: .min,
                      children: [
                        Text(
                          context.l10n.welcomeTo,
                          style: ShadTheme.of(context).textTheme.h1,
                        ),
                        const SizedBox(height: Spaces.sm),
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
                    const SizedBox(height: Spaces.md),

                    Text(
                      context.l10n.youHaveThePlanWeProvideTheDiscipline,
                      maxLines: 2,
                      style: ShadTheme.of(context).textTheme.h4,
                      textAlign: .center,
                    ),
                    const SizedBox(height: Spaces.xxl),
                    Consumer(
                      builder: (context, ref, _) {
                        ref.listen(onboardingDataStateProvider, (_, _) {});
                        return ShadButton(
                          height: Spaces.buttonHeight,
                          width: double.infinity,
                          child: Text(context.l10n.getStarted),
                          onPressed: () {
                            ref
                                .read(routesProvider)
                                .goNamed(RouteNames.onboarding2Excuses);
                          },
                        );
                      },
                    ),
                    ShadButton.link(
                      onPressed: () {
                        context.goNamed(RouteNames.login);
                      },
                      child: Text('I have an account'),
                    ),
                    const SizedBox(height: Spaces.lg),
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 20,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Spaces.horizontal),
                child: LanguageSwitchWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
