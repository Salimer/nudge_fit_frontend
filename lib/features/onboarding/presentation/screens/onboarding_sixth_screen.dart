import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/widgets/mighty_onboarding.dart';
import '../widgets/apple_sign_in_widget.dart';
import '../widgets/google_sign_in_widget.dart';

class OnboardingSixthScreen extends StatelessWidget {
  const OnboardingSixthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProudMighty(),

                  SizedBox(height: 20),
                  Text(
                    context.l10n.contractSealed,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: .center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    context.l10n.createAccountText,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: .center,
                  ),

                  SizedBox(height: 20),

                  if (Platform.isIOS) ...[
                    AppleSignInWidget(),
                    SizedBox(height: 12),
                  ],

                  GoogleSignInWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
