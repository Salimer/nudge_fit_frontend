import 'package:flutter/material.dart';
import 'package:nudge_fit_frontend/core/extensions/build_context.dart';
import 'package:nudge_fit_frontend/core/common/widgets/mighty_onboarding.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(context.l10n.homeSetupGreeting('name')),
              Text(context.l10n.homeSetupTitle),
              ReadingMighty(),
            ],
          ),
        ),
      ),
    );
  }
}
