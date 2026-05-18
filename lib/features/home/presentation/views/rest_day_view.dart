import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nudge_fit_frontend/features/home/presentation/state/home_screen_state.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../data/models/home_screen_model.dart';
import '../widgets/streak_widget.dart';

class RestDayView extends StatelessWidget {
  const RestDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Spaces.all),
        child: Consumer(
          builder: (context, ref, _) {
            final RestDayModel data =
                ref.read(homeScreenStateProvider).requireValue as RestDayModel;
            return Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  context.l10n.homeRestGreeting(data.username),
                  style: ShadTheme.of(context).textTheme.p,
                ),
                const SizedBox(height: Spaces.sm),
                Text(
                  context.l10n.homeRestTitle,
                  style: ShadTheme.of(context).textTheme.h2,
                ),
                const SizedBox(height: Spaces.lg),
                StreakWidget(streak: data.streak),
                const SizedBox(height: Spaces.lg),
                const Center(child: RestingMighty()),
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
                        context.l10n.homeRestLabel,
                        style: ShadTheme.of(context).textTheme.h2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: Spaces.md),
                      Text(
                        context.l10n.homeRestBody,
                        style: ShadTheme.of(context).textTheme.p,
                        textAlign: TextAlign.center,
                      ),
                    ],
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
