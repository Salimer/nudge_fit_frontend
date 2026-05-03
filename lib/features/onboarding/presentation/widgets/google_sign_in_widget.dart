import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
          return ShadButton.outline(
            onPressed: () {
              // Your Google Sign-In Logic
              ref.read(routesProvider).goNamed(RouteNames.onboardingSeventh);
            },
            leading: SvgPicture.asset(
              SocialMediaIcons.googleLogo,
              height: Spaces.lg, // Standard Google branding size
            ),
            child: Text(
              context.l10n.continueWithGoogle,
              style: ShadTheme.of(context).textTheme.large,
            ),
          );
        },
      ),
    );
  }
}
