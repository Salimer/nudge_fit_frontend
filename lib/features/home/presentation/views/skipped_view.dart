import 'package:flutter/material.dart';

import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/extensions/build_context.dart';
import '../widgets/streak_widget.dart';

class SkippedView extends StatelessWidget {
  const SkippedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppPadding.vertical,
          horizontal: AppPadding.horizontal,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [Text(context.l10n.homeSkippedGreeting('name'))]),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      context.l10n.homeSkippedTitle,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CryingMighty(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                  maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                ),
                // StreakWidget(streak: 0),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    children: [
                      Text(context.l10n.homeLoggedLabel),
                      SizedBox(height: 10),
                      Text(context.l10n.homeLoggedExcuse('excuse')),
                      SizedBox(height: 10),
                      Text(context.l10n.homeLoggedStatusSkipped),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(context.l10n.homeSkippedNudge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
