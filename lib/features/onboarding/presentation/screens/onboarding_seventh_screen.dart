import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/state/routes_state.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/mighty_onboarding.dart';

class OnboardingSeventhScreen extends StatelessWidget {
  const OnboardingSeventhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(context.l10n.paywallHeader("name")),
                PremiumMighty(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 5,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: .stretch,
                            children: [
                              Align(
                                alignment: .center,
                                child: Text(context.l10n.tierFreeTitle),
                              ),
                              Align(
                                alignment: .center,
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
                            border: Border.all(color: Colors.black, width: 4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: .center,
                                child: Text(context.l10n.tierPremiumTitle),
                              ),
                              Align(
                                alignment: .center,
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

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: AppPadding.vertical,
          right: AppPadding.horizontal,
          left: AppPadding.horizontal,
        ),
        child: Column(
          mainAxisSize: .min,
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
    );
  }

  Row _buildTierFeature(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      mainAxisAlignment: .start,
      children: [
        Icon(Icons.check),
        Flexible(child: Text(text)),
      ],
    );
  }
}
