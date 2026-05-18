import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nudge_fit_frontend/features/home/presentation/state/home_screen_state.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../data/models/home_screen_model.dart';
import '../widgets/started_widget.dart';
import '../widgets/streak_widget.dart';

class ActionRequiredView extends StatelessWidget {
  const ActionRequiredView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Spaces.all),
        child: Consumer(
          builder: (context, ref, _) {
            final data =
                ref.read(homeScreenStateProvider).requireValue
                    as ActionRequiredModel;
            return Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  context.l10n.homeRestGreeting(data.username),
                  style: ShadTheme.of(context).textTheme.p,
                ),
                const SizedBox(height: Spaces.sm),
                Text(
                  context.l10n.homeActionTitle,
                  style: ShadTheme.of(context).textTheme.h2,
                ),
                const SizedBox(height: Spaces.lg),
                StreakWidget(streak: data.streak),
                const SizedBox(height: Spaces.lg),
                const Center(child: SeriousMighty()),
                const SizedBox(height: Spaces.lg),
                Text(
                  data.inAppMessage ?? context.l10n.actionAnticipationMsg,
                  style: ShadTheme.of(context).textTheme.blockquote,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spaces.lg),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(Spaces.md),
                  decoration: BoxDecoration(
                    color: ShadTheme.of(context).colorScheme.muted,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: ShadTheme.of(context).colorScheme.border,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_clock_rounded,
                        size: 32,
                        color: ShadTheme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Spaces.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              context.l10n.homeContractLabel,
                              style: ShadTheme.of(context).textTheme.h4,
                            ),
                            Text(
                              context.l10n.homeContractTime(data.targetTime),
                              style: ShadTheme.of(context).textTheme.p,
                            ),
                            Text(
                              context.l10n.homeContractStatusPending,
                              style: ShadTheme.of(context).textTheme.muted,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Spaces.xl),
                StartedWidget(onPressed: () {}),
                const SizedBox(height: Spaces.sm),
                Center(
                  child: ShadButton.link(
                    onPressed: () {},
                    child: Text(context.l10n.btnSkip),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
