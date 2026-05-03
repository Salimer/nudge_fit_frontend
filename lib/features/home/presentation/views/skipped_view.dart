import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';

class SkippedView extends StatelessWidget {
  const SkippedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Spaces.vertical,
          horizontal: Spaces.horizontal,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [Text(context.l10n.homeSkippedGreeting('name'))]),
                SizedBox(height: Spaces.lg),
                Row(
                  children: [
                    Text(
                      context.l10n.homeSkippedTitle,
                      style: ShadTheme.of(context).textTheme.h2,
                    ),
                  ],
                ),
                SizedBox(height: Spaces.lg),
                CryingMighty(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                  maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                ),
                SizedBox(height: Spaces.lg),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(Spaces.md),

                  child: Column(
                    children: [
                      Text(context.l10n.homeLoggedLabel),
                      SizedBox(height: Spaces.sm),
                      Text(context.l10n.homeLoggedExcuse('excuse')),
                      SizedBox(height: Spaces.sm),
                      Text(context.l10n.homeLoggedStatusSkipped),
                    ],
                  ),
                ),
                SizedBox(height: Spaces.lg),
                Text(context.l10n.homeSkippedNudge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
