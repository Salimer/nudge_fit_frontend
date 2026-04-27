import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/state/routes_state.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/mighty_onboarding.dart';
import '../widgets/language_switch_widget.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .max,
            children: [
              LanguageSwitchWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: .min,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      NeutralMighty(),
                      Column(
                        mainAxisSize: .min,
                        children: [
                          Text(
                            context.l10n.welcomeTo,
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          Text(
                            context.l10n.nudgeFit.toUpperCase(),
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
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

                      Text(
                        context.l10n.youHaveThePlanWeProvideTheDiscipline,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: .center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Divider(
                          height: 6,
                          thickness: 6,
                          color: Colors.grey[300],
                          radius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, _) {
                          return CustomElevatedButton1(
                            text: context.l10n.getStarted,
                            onPressed: () {
                              ref
                                  .read(routesProvider)
                                  .goNamed(RouteNames.onboardingSecond);
                            },
                          );
                        },
                      ),
                    ],
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
