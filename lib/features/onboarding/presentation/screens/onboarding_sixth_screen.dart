import 'dart:io';

import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../widgets/apple_sign_in_widget.dart';
import '../widgets/google_sign_in_widget.dart';

class OnboardingSixthScreen extends StatelessWidget {
  const OnboardingSixthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: const FHeader(title: Text('')),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProudMighty(),

                  const SizedBox(height: 20),
                  Text(
                    context.l10n.contractSealed,
                    style: FTheme.of(context).typography.xl4.copyWith(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    context.l10n.createAccountText,
                    style: FTheme.of(context).typography.xl,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  if (Platform.isIOS) ...[
                    const AppleSignInWidget(),
                    const SizedBox(height: 12),
                  ],

                  const GoogleSignInWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
