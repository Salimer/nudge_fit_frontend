import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/state/go_router_state.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/mighty_onboarding.dart';

class OnboardingFourthScreen extends StatelessWidget {
  const OnboardingFourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SeriousMighty(),
            Center(child: Text('Fourth screen')),
          ],
        ),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
            child: CustomButton1(
              text: context.l10n.next,
              onPressed: () {
                ref.read(routesProvider).goNamed(RouteNames.onboardingFourth);
              },
            ),
          );
        },
      ),
    );
  }
}
