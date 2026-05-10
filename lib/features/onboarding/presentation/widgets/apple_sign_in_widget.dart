import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/assets/social_media_icons.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/routes_state.dart';

class AppleSignInWidget extends StatelessWidget {
  const AppleSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Consumer(
        builder: (context, ref, _) {
          return ShadButton(
            onPressed: () {
              ref.read(routesProvider).goNamed(RouteNames.onboarding9Paywall);
            },
            leading: SvgPicture.asset(
              SocialMediaIcons.appleLogo,
              height: Spaces.lg,
              colorFilter: ColorFilter.mode(
                ShadTheme.of(context).colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
            child: Text(context.l10n.signInWithApple),
          );
        },
      ),
    );
  }
}
