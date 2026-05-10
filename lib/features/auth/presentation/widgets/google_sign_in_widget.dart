import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nudge_fit_frontend/features/auth/use_cases/auth_use_case.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/assets/social_media_icons.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/common/state/routes_state.dart';
import '../../../../core/extensions/build_context.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Consumer(
        builder: (context, ref, _) {
          ref.listen(signInMutation, (_, state) {
            if (state is MutationPending) {
              showDialog(
                context: context,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()),
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
            }
          });
          // final mutation = ref.watch(signInMutation);
          return ShadButton.outline(
            onPressed: () {
              // context.goNamed(RouteNames.onboardingSeventh);
              signInMutation
                  .run(ref, (tsx) async {
                    await tsx.get(authUseCaseProvider).googleSignIn();
                  })
                  .catchError((_) {});
            },
            leading: SvgPicture.asset(
              SocialMediaIcons.googleLogo,
              height: Spaces.lg,
            ),
            child: Text(context.l10n.continueWithGoogle),
          );
        },
      ),
    );
  }
}
