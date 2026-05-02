import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/routes_state.dart';
import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/mighty.dart';

class OnboardingFourthScreen extends StatelessWidget {
  const OnboardingFourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spaces.sm),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SeriousMighty(),
                SizedBox(height: Spaces.lg),
                Text(
                  context.l10n.commitmentTitle,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: .center,
                ),
                SizedBox(height: Spaces.lg),
                Text(
                  context.l10n.commitmentBody,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: Spaces.lg),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(Spaces.sm),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "✅ ${context.l10n.nudgeFriendly}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "⚠️ ${context.l10n.nudgeLate}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "🚨${context.l10n.nudgePersistent}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) {
          return Padding(
            padding: const EdgeInsets.only(
              left: Spaces.lg,
              right: Spaces.lg,
              bottom: Spaces.xl,
            ),
            child: Column(
              mainAxisSize: .min,
              children: [
                PrimaryButton(
                  text: context.l10n.btnUnderstandNag,
                  onPressed: () {
                    ref
                        .read(routesProvider)
                        .goNamed(RouteNames.onboardingFifth);
                  },
                ),
                SizedBox(height: Spaces.xs),
                GestureDetector(
                  onTap: () {
                    ref
                        .read(routesProvider)
                        .goNamed(RouteNames.onboardingFifth);
                  },
                  child: Text(
                    context.l10n.btnMaybeLater,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.black,
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
    );
  }
}
