import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../data/models/home_screen_model.dart';
import '../state/home_screen_state.dart';

class SkippedView extends StatelessWidget {
  const SkippedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(Spaces.all),
        child: Consumer(
          builder: (context, ref, _) {
            final SkippedModel data =
                ref.read(homeScreenStateProvider).requireValue as SkippedModel;
            return Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  context.l10n.homeSkippedGreeting(data.username),
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
                        context.l10n.homeLoggedExcuse(data.excuseMessage),
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
            );
          },
        ),
      ),
    );
  }
}
