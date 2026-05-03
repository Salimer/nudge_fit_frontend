import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/mighty.dart';
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Spaces.all),
            child: Column(
              children: [
                ProudMighty(),

                SizedBox(height: Spaces.lg),
                Text(
                  context.l10n.contractSealed,
                  style: ShadTheme.of(context).textTheme.h1Large,
                  textAlign: .center,
                ),
                SizedBox(height: Spaces.lg),
                Text(
                  context.l10n.createAccountText,
                  style: ShadTheme.of(context).textTheme.h4,
                  textAlign: .center,
                ),

                SizedBox(height: Spaces.lg),

                if (Platform.isIOS) ...[
                  AppleSignInWidget(),
                  SizedBox(height: Spaces.md),
                ],

                GoogleSignInWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
