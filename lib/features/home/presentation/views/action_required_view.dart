import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../widgets/started_widget.dart';
import '../widgets/streak_widget.dart';

class ActionRequiredView extends StatelessWidget {
  const ActionRequiredView({super.key});

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
                Row(children: [Text(context.l10n.homeRestGreeting('name'))]),
                SizedBox(height: Spaces.lg),
                Row(
                  children: [
                    Text(
                      context.l10n.homeActionTitle,
                      style: ShadTheme.of(context).textTheme.h2,
                    ),
                  ],
                ),
                SizedBox(height: Spaces.lg),
                StreakWidget(),
                SizedBox(height: Spaces.lg),
                SeriousMighty(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                  maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                ),
                SizedBox(height: Spaces.lg),
                Text(
                  context.l10n.actionAnticipationMsg,
                  style: ShadTheme.of(context).textTheme.blockquote,
                ),
                SizedBox(height: Spaces.lg),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spaces.md,
                    vertical: Spaces.lg,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    crossAxisAlignment: .end,
                    mainAxisSize: .min,
                    children: [
                      Column(
                        mainAxisSize: .max,
                        mainAxisAlignment: .end,
                        children: [Icon(Icons.lock_clock_rounded, size: 40)],
                      ),
                      SizedBox(width: Spaces.sm),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            context.l10n.homeContractLabel,
                            style: ShadTheme.of(context).textTheme.h4,
                          ),
                          SizedBox(height: Spaces.sm),
                          Text(
                            context.l10n.homeContractTime('8:00 PM'),
                            style: ShadTheme.of(context).textTheme.p,
                          ),
                          Text(context.l10n.homeContractStatusPending),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Spaces.lg),
                StartedWidget(onPressed: () {}),
                ShadButton.link(
                  child: Text(
                    context.l10n.btnSkip,
                    style: ShadTheme.of(context).textTheme.p,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
