import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/state/routes_state.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../../auth/use_cases/auth_use_case.dart';
import '../../use_cases/onboarding_use_case.dart';
import '../widgets/apple_sign_in_widget.dart';
import '../../../auth/presentation/widgets/google_sign_in_widget.dart';

class Onboarding8AuthScreen extends ConsumerWidget {
  const Onboarding8AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listeners(ref, context);
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

  void _listeners(WidgetRef ref, BuildContext context) {
    ref.listen(signInMutation, (_, state) async {
      if (state is MutationPending) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
              const Center(child: CircularProgressIndicator(color: Colors.red)),
        );
      } else if (state is MutationError) {
        debugPrint(state.error.toString());
        context.pop();
        ShadToaster.of(context).show(
          ShadToast.destructive(
            alignment: .topCenter,
            description: Text(state.error.toString()),
            showCloseIconOnlyWhenHovered: false,
            duration: const Duration(seconds: 1000),
          ),
        );
      } else if (state is MutationSuccess) {
        context.pop();
        await Future.delayed(const Duration(milliseconds: 500));
        onboardMutation
            .run(ref, (tsx) async {
              await tsx.get(onboardingUseCaseProvider).onboard();
            })
            .catchError((_) {});
      }
    });

    ref.listen(onboardMutation, (_, state) {
      if (state is MutationPending) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(color: Colors.green),
          ),
        );
      } else if (state is MutationError) {
        context.pop();
        ShadToaster.of(context).show(
          ShadToast.destructive(
            alignment: .topCenter,
            description: Text(state.error.toString()),
            showCloseIconOnlyWhenHovered: false,
            duration: const Duration(seconds: 1000),
          ),
        );
      } else if (state is MutationSuccess) {
        context.pop();
        context.goNamed(RouteNames.homeScreen);
      }
    });
  }
}
