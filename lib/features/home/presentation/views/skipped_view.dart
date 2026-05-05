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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Spaces.all),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              context.l10n.homeSkippedGreeting('name'),
              style: ShadTheme.of(context).textTheme.p,
            ),
            const SizedBox(height: Spaces.sm),
            Text(
              context.l10n.homeSkippedTitle,
              style: ShadTheme.of(context).textTheme.h2,
            ),
            const SizedBox(height: Spaces.lg),
            Center(
              child: CryingMighty(
                maxHeight: MediaQuery.sizeOf(context).height * 0.4,
                maxWidth: MediaQuery.sizeOf(context).width * 0.7,
              ),
            ),
            const SizedBox(height: Spaces.lg),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Spaces.lg),
              decoration: BoxDecoration(
                color: ShadTheme.of(context).colorScheme.muted,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: ShadTheme.of(context).colorScheme.border,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    context.l10n.homeLoggedLabel,
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                  const SizedBox(height: Spaces.sm),
                  Text(
                    context.l10n.homeLoggedExcuse('excuse'),
                    style: ShadTheme.of(context).textTheme.p,
                  ),
                  const SizedBox(height: Spaces.sm),
                  Text(
                    context.l10n.homeLoggedStatusSkipped,
                    style: ShadTheme.of(context).textTheme.small,
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spaces.lg),
            Text(
              context.l10n.homeSkippedNudge,
              style: ShadTheme.of(context).textTheme.muted,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
