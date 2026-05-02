import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

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
      height: Spaces.buttonHeight,
      child: Consumer(
        builder: (context, ref, _) {
          return OutlinedButton.icon(
            onPressed: () {
              // Your Google Sign-In Logic
              ref.read(routesProvider).goNamed(RouteNames.onboardingSeventh);
            },
            icon: SvgPicture.asset(
              SocialMediaIcons.googleLogo,
              height: Spaces.lg, // Standard Google branding size
            ),
            label: Text(
              context.l10n.continueWithGoogle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(
                color: Color(0xFFDADCE0),
              ), // Google's specific border hex
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ), // Match your Apple button
              ),
              elevation: 0,
            ),
          );
        },
      ),
    );
  }
}
