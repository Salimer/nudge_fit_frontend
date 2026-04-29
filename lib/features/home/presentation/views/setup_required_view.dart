import 'package:flutter/material.dart';

import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/days_and_time_picker_widget.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/app_padding.dart';
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
            padding: const EdgeInsets.symmetric(vertical: AppPadding.vertical),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.vertical,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.horizontal,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              context.l10n.homeSetupGreeting('name'),
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: .start,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          context.l10n.homeSetupTitle,
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: .center,
                        ),
                        SizedBox(height: 20),
                        ReadingMighty(
                          maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                          maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  DaysAndTimePickerWidget(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: AppPadding.horizontal,
                      left: AppPadding.horizontal,
                    ),
                    child: CustomElevatedButton1(
                      text: context.l10n.homeSetupBtn,
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
