import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/assets/social_media_icons.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../use_cases/auth_use_case.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        // final mutation = ref.watch(signInMutation);
        final bool isFromLogin = ref
            .read(authUseCaseProvider)
            .isLoginRoute(GoRouterState.of(context));

        return ShadButton.outline(
          height: Spaces.buttonHeight,
          width: double.infinity,
          onPressed: () {
            // context.goNamed(RouteNames.onboardingSeventh);
            signInMutation
                .run(ref, (tsx) async {
                  await tsx
                      .get(authUseCaseProvider)
                      .googleSignIn(loginOrFail: isFromLogin);
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
    );
  }
}
