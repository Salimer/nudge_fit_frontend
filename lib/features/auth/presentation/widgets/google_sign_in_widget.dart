import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nudge_fit_frontend/features/auth/use_cases/auth_use_case.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/assets/social_media_icons.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Consumer(
        builder: (context, ref, _) {
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
