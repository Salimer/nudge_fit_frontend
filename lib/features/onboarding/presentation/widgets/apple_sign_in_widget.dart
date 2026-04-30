import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forui/forui.dart';

import '../../../../core/assets/social_media_icons.dart';
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
          return FButton(
            variant: FButtonVariant.primary,
            onPress: () {
              ref.read(routesProvider).goNamed(RouteNames.onboardingSeventh);
            },
            prefix: SvgPicture.asset(
              SocialMediaIcons.appleLogo,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            child: Text(
              context.l10n.signInWithApple,
              style: FTheme.of(context).typography.lg.copyWith(
                color: FTheme.of(context).colors.primaryForeground,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}
