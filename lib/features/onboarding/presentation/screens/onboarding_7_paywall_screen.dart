import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/state/routes_state.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/mighty.dart';

class Onboarding7PaywallScreen extends StatelessWidget {
  const Onboarding7PaywallScreen({super.key});

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
                Text(
                  context.l10n.paywallHeader('name'),
                  style: ShadTheme.of(context).textTheme.h2,
                ),
                const SizedBox(height: Spaces.lg),
                const PremiumMighty(),
                const SizedBox(height: Spaces.lg),
                _buildFeaturesSection(context),
                const SizedBox(height: Spaces.xxl),
                Column(
                  mainAxisSize: .min,
                  children: [
                    ShadButton(
                      width: double.infinity,
                      onPressed: () {},
                      child: Text(context.l10n.btnUpgrade),
                    ),
                    Consumer(
                      builder: (context, ref, _) {
                        return ShadButton.link(
                          child: Text(context.l10n.btnContinueFree),
                          onPressed: () {
                            ref
                                .read(routesProvider)
                                .goNamed(RouteNames.homeScreen);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildFeaturesSection(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      spacing: Spaces.sm,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(Spaces.sm),
            decoration: BoxDecoration(
              color: ShadTheme.of(context).colorScheme.muted,
              border: Border.all(
                color: ShadTheme.of(context).colorScheme.secondary,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                Align(
                  alignment: .center,
                  child: Text(
                    context.l10n.tierFreeTitle,
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                ),
                const SizedBox(height: Spaces.sm),
                Align(
                  alignment: .center,
                  child: Text(
                    context.l10n.tierFreeSub,
                    style: ShadTheme.of(context).textTheme.small,
                  ),
                ),
                const SizedBox(height: Spaces.md),
                _buildTierFeature(context, context.l10n.freeFeature1),
                _buildTierFeature(context, context.l10n.freeFeature2),
                _buildTierFeature(context, context.l10n.freeFeature3),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(Spaces.sm),
            decoration: BoxDecoration(
              color: ShadTheme.of(context).colorScheme.muted,
              border: Border.all(
                color: ShadTheme.of(context).colorScheme.primary,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Align(
                  alignment: .center,
                  child: Text(
                    context.l10n.tierPremiumTitle,
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                ),
                const SizedBox(height: Spaces.sm),
                Align(
                  alignment: .center,
                  child: Text(
                    context.l10n.tierPremiumSub,
                    style: ShadTheme.of(context).textTheme.small,
                  ),
                ),
                const SizedBox(height: Spaces.md),
                _buildTierFeature(context, context.l10n.premiumFeature1),
                _buildTierFeature(context, context.l10n.premiumFeature2),
                _buildTierFeature(context, context.l10n.premiumFeature3),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _buildTierFeature(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      mainAxisAlignment: .start,
      children: [
        const Icon(LucideIcons.check),
        const SizedBox(width: Spaces.xs),
        Flexible(child: Text(text, style: ShadTheme.of(context).textTheme.p)),
      ],
    );
  }
}
