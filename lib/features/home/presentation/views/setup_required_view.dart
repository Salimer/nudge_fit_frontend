import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/widgets/days_and_time_picker_widget.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';

class SetupRequiredView extends StatelessWidget {
  const SetupRequiredView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Spaces.vertical),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Spaces.vertical),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spaces.horizontal,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              context.l10n.homeSetupGreeting('name'),
                              style: ShadTheme.of(context).textTheme.p,
                              textAlign: .start,
                            ),
                          ],
                        ),
                        SizedBox(height: Spaces.lg),
                        Text(
                          context.l10n.homeSetupTitle,
                          style: ShadTheme.of(context).textTheme.h2,
                          textAlign: .center,
                        ),
                        SizedBox(height: Spaces.lg),
                        ReadingMighty(
                          maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                          maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Spaces.lg),
                  DaysAndTimePickerWidget(),
                  SizedBox(height: Spaces.lg),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: Spaces.horizontal,
                      left: Spaces.horizontal,
                    ),
                    child: ShadButton(
                      child: Text(context.l10n.homeSetupBtn),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
