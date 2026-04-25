import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nudge_fit_frontend/core/assets/mighty.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/state/locale_state.dart';
import '../../../../core/widgets/buttons.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer(
                builder: (context, ref, _) {
                  return DropdownButton(
                    items: [
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text(context.l10n.arabic),
                      ),
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(context.l10n.english),
                      ),
                    ],
                    onChanged: (value) {
                      ref
                          .read(localeStateProvider.notifier)
                          .changeLocale(value!);
                    },
                    value: ref
                        .watch(localeStateProvider)
                        .requireValue
                        .languageCode,
                    style: TextStyle(color: Colors.red),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: .min,
                mainAxisAlignment: .spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.3,
                      // maxHeight: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: SvgPicture.asset(
                      MightyAssets.neutral,
                      // height: double.infinity,
                    ),
                  ),
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
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
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
                  CustomButton1(
                    text: context.l10n.getStarted,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
