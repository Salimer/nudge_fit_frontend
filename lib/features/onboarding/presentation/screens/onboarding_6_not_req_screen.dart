import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/routes_state.dart';
import '../../../../core/common/widgets/mighty.dart';

class Onboarding6NotReqScreen extends StatelessWidget {
  const Onboarding6NotReqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spaces.all),
          child: Column(
            children: [
              const SeriousMighty(),
              const SizedBox(height: Spaces.xxl),
              Text(
                context.l10n.commitmentTitle,
                style: ShadTheme.of(context).textTheme.h1Large,
                textAlign: .center,
                maxLines: 2,
              ),
              const SizedBox(height: Spaces.lg),
              Text(
                context.l10n.commitmentBody,
                style: ShadTheme.of(context).textTheme.p,
              ),
              const SizedBox(height: Spaces.lg),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(Spaces.sm),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      '✅ ${context.l10n.nudgeFriendly}',
                      style: ShadTheme.of(context).textTheme.p,
                    ),
                    Text(
                      '⚠️ ${context.l10n.nudgeLate}',
                      style: ShadTheme.of(context).textTheme.p,
                    ),
                    Text(
                      '🚨${context.l10n.nudgePersistent}',
                      style: ShadTheme.of(context).textTheme.p,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: Spaces.xxl),

              Consumer(
                builder: (context, ref, _) {
                  return Column(
                    mainAxisSize: .min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ShadButton(
                          child: Text(context.l10n.btnUnderstandNag),
                          onPressed: () {
                            ref
                                .read(routesProvider)
                                .goNamed(RouteNames.onboarding7SealCommitment);
                          },
                        ),
                      ),
                      // SizedBox(height: Spaces.xs),
                      ShadButton.link(
                        child: Text(context.l10n.btnMaybeLater),
                        onPressed: () {
                          ref
                              .read(routesProvider)
                              .goNamed(RouteNames.onboarding7SealCommitment);
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
