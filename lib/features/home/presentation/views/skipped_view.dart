import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/extensions/build_context.dart';

class SkippedView extends StatelessWidget {
  const SkippedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.vertical,
          horizontal: AppPadding.horizontal,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [Text(context.l10n.homeSkippedGreeting('name'))]),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      context.l10n.homeSkippedTitle,
                      style: FTheme.of(context).typography.xl3.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CryingMighty(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                  maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: FTheme.of(context).colors.border),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    children: [
                      Text(context.l10n.homeLoggedLabel),
                      const SizedBox(height: 10),
                      Text(context.l10n.homeLoggedExcuse('excuse')),
                      const SizedBox(height: 10),
                      Text(context.l10n.homeLoggedStatusSkipped),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(context.l10n.homeSkippedNudge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
