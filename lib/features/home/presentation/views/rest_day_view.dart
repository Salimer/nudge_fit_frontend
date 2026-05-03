import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../widgets/streak_widget.dart';

class RestDayView extends StatelessWidget {
  const RestDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spaces.horizontal,
          vertical: Spaces.vertical,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      context.l10n.homeRestGreeting('name'),
                      style: ShadTheme.of(context).textTheme.p,
                    ),
                  ],
                ),
                const SizedBox(height: Spaces.lg),
                Row(
                  children: [
                    Text(
                      context.l10n.homeRestTitle,
                      style: ShadTheme.of(context).textTheme.h2,
                    ),
                  ],
                ),
                const SizedBox(height: Spaces.lg),
                StreakWidget(streak: 2),
                RestingMighty(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                  maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                ),
                const SizedBox(height: Spaces.lg),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spaces.md,
                    vertical: Spaces.lg,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        context.l10n.homeRestLabel,
                        style: ShadTheme.of(context).textTheme.h2,
                      ),
                      SizedBox(height: Spaces.lg),
                      Text(
                        context.l10n.homeRestBody,
                        style: ShadTheme.of(context).textTheme.p,
                        textAlign: .center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
