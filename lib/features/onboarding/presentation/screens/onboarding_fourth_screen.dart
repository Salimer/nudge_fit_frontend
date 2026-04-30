import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/routes_state.dart';
import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/mighty.dart';

class OnboardingFourthScreen extends StatelessWidget {
  const OnboardingFourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: const FHeader(title: Text('')),
      footer: Consumer(
        builder: (context, ref, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomElevatedButton1(
                  text: context.l10n.btnUnderstandNag,
                  onPressed: () {
                    ref
                        .read(routesProvider)
                        .goNamed(RouteNames.onboardingFifth);
                  },
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    ref
                        .read(routesProvider)
                        .goNamed(RouteNames.onboardingFifth);
                  },
                  child: Text(
                    context.l10n.btnMaybeLater,
                    style: FTheme.of(context).typography.sm.copyWith(
                      color: FTheme.of(context).colors.primary,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SeriousMighty(),
                const SizedBox(height: 20),
                Text(
                  context.l10n.commitmentTitle,
                  style: FTheme.of(context).typography.xl4.copyWith(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  context.l10n.commitmentBody,
                  style: FTheme.of(context).typography.lg,
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: FTheme.of(context).colors.border,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "✅ ${context.l10n.nudgeFriendly}",
                        style: FTheme.of(context).typography.lg,
                      ),
                      Text(
                        "⚠️ ${context.l10n.nudgeLate}",
                        style: FTheme.of(context).typography.lg,
                      ),
                      Text(
                        "🚨${context.l10n.nudgePersistent}",
                        style: FTheme.of(context).typography.lg,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
