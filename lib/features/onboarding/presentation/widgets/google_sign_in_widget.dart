import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';

import '../../../../core/assets/social_media_icons.dart';
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
          return FButton(
            variant: FButtonVariant.outline,
            onPress: () {
              // Your Google Sign-In Logic
              ref.read(routesProvider).goNamed(RouteNames.onboardingSeventh);
            },
            prefix: SvgPicture.asset(
              SocialMediaIcons.googleLogo,
              height: 24,
            ),
            child: Text(
              context.l10n.continueWithGoogle,
              style: FTheme.of(context).typography.lg.copyWith(
                color: FTheme.of(context).colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}
