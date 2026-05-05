import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../use_cases/home_use_case.dart';
import '../widgets/streak_widget.dart';

class CompletedView extends StatelessWidget {
  const CompletedView({super.key});

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
              context.l10n.homeCompletedGreeting('name'),
              style: ShadTheme.of(context).textTheme.p,
            ),
            const SizedBox(height: Spaces.sm),
            Text(
              context.l10n.homeCompletedTitle,
              style: ShadTheme.of(context).textTheme.h2,
            ),
            const SizedBox(height: Spaces.lg),
            const StreakWidget(streak: 4),
            const SizedBox(height: Spaces.lg),
            const Center(child: CelebratingMighty()),
            const SizedBox(height: Spaces.lg),
            Consumer(
              builder: (context, ref, _) {
                return Column(
                  children: [
                    Text(
                      context.l10n.homeCompletedStatus(
                        _getLocalizedDay(ref, 'Monday'),
                      ),
                      style: ShadTheme.of(context).textTheme.h4,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Spaces.md),
                    Text(
                      context.l10n.homeCompletedBody(
                        _getLocalizedDay(ref, 'Wednesday'),
                      ),
                      style: ShadTheme.of(context).textTheme.p,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getLocalizedDay(WidgetRef ref, String day) {
    return ref.read(homeUseCaseProvider).localizedDay(day);
  }
}
