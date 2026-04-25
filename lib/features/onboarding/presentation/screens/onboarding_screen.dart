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
                  SvgPicture.asset(MightyAssets.neutral, height: 100),
                  Text(context.l10n.welcomeTo),
                  Text(context.l10n.nudgeFit),
                  Column(
                    mainAxisSize: .min,
                    children: [
                      Text(context.l10n.weDoOnlyOneThing),
                      Text(context.l10n.makeSureYouShowUp),
                    ],
                  ),

                  Text(
                    context.l10n.youHaveThePlanWeProvideTheDiscipline,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic),
                    textAlign: .center,
                  ),
                  CustomButton1(text: context.l10n.getStarted, onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
