import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(context.l10n.helloWorld)));
  }
}
