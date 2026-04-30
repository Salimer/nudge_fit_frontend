import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/app_padding.dart';
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
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.vertical,
          horizontal: AppPadding.horizontal,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [Text(context.l10n.homeRestGreeting('name'))]),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      context.l10n.homeActionTitle,
                      style: FTheme.of(context).typography.xl3.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const StreakWidget(),
                const SizedBox(height: 20),
                SeriousMighty(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                  maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                ),
                const SizedBox(height: 20),
                Text(
                  context.l10n.actionAnticipationMsg,
                  style: FTheme.of(context).typography.lg.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: FTheme.of(context).colors.border),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Icon(FIcons.clock, size: 40)],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.homeContractLabel,
                            style: FTheme.of(context).typography.xl
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            context.l10n.homeContractTime('8:00 PM'),
                            style: FTheme.of(context).typography.sm,
                          ),
                          Text(context.l10n.homeContractStatusPending),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                StartedWidget(onPressed: () {}),
                CustomTextButtonWidget(
                  text: context.l10n.btnSkip,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
