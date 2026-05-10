import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../widgets/apple_sign_in_widget.dart';
import '../../../auth/presentation/widgets/google_sign_in_widget.dart';

class Onboarding8AuthScreen extends ConsumerWidget {
  const Onboarding8AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Spaces.all),
            child: Column(
              children: [
                const ProudMighty(),

                const SizedBox(height: Spaces.lg),
                Text(
                  context.l10n.contractSealed,
                  style: ShadTheme.of(context).textTheme.h1Large,
                  textAlign: .center,
                ),
                const SizedBox(height: Spaces.lg),
                Text(
                  context.l10n.createAccountText,
                  style: ShadTheme.of(context).textTheme.h4,
                  textAlign: .center,
                ),

                const SizedBox(height: Spaces.lg),

                if (Platform.isIOS) ...[
                  const AppleSignInWidget(),
                  const SizedBox(height: Spaces.md),
                ],

                const GoogleSignInWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
