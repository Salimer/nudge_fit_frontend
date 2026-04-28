import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets/social_media_icons.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/routes_state.dart';

class AppleSignInWidget extends StatelessWidget {
  const AppleSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height:
          56, // Apple's preferred height is 44-60; 56 is the "sweet spot" for modern apps
      child: Consumer(
        builder: (context, ref, _) {
          return FilledButton.icon(
            onPressed: () {
              ref.read(routesProvider).goNamed(RouteNames.onboardingSeventh);
            },
            icon: SvgPicture.asset(
              SocialMediaIcons.appleLogo,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: Text(
              context.l10n.signInWithApple,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 0,
              // Apple's "Continue with Apple" buttons usually have a radius of 8-12
              // or are fully stadium-shaped. 12 is the current iOS standard.
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              // Padding ensures the icon and text don't feel cramped
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          );
        },
      ),
    );
  }
}
