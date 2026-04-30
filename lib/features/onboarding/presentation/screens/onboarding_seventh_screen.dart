import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import '../../../../core/common/state/routes_state.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/mighty.dart';

class OnboardingSeventhScreen extends StatelessWidget {
  const OnboardingSeventhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: const FHeader(title: Text('')),

      footer: Padding(
        padding: const EdgeInsets.only(
          bottom: AppPadding.vertical,
          right: AppPadding.horizontal,
          left: AppPadding.horizontal,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 56,
              width: double.infinity,
              child: CustomFilledButton(
                text: context.l10n.btnUpgrade,
                onPressed: () {},
                isLoading: false,
              ),
            ),
            Consumer(
              builder: (context, ref, _) {
                return CustomTextButtonWidget(
                  onTap: () {
                    ref.read(routesProvider).goNamed(RouteNames.homeScreen);
                  },
                  text: context.l10n.btnContinueFree,
                );
              },
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(context.l10n.paywallHeader("name")),
                const PremiumMighty(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 5,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: FTheme.of(context).colors.border, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(context.l10n.tierFreeTitle),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(context.l10n.tierFreeSub),
                              ),
                              _buildTierFeature(
                                context,
                                context.l10n.freeFeature1,
                              ),
                              _buildTierFeature(
                                context,
                                context.l10n.freeFeature2,
                              ),
                              _buildTierFeature(
                                context,
                                context.l10n.freeFeature3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: FTheme.of(context).colors.border, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(context.l10n.tierPremiumTitle),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(context.l10n.tierPremiumSub),
                              ),
                              _buildTierFeature(
                                context,
                                context.l10n.premiumFeature1,
                              ),
                              _buildTierFeature(
                                context,
                                context.l10n.premiumFeature2,
                              ),
                              _buildTierFeature(
                                context,
                                context.l10n.premiumFeature3,
                              ),
                            ],
                          ),
                        ),
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

  Row _buildTierFeature(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(FIcons.check),
        Flexible(child: Text(text)),
      ],
    );
  }
}
