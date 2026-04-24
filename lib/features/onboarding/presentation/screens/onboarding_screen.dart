import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/state/locale_state.dart';
import '../../../../core/widgets/buttons.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Consumer(
            builder: (context, ref, _) {
              return DropdownButton(
                items: [
                  DropdownMenuItem(value: 'ar', child: Text('Arabic')),
                  DropdownMenuItem(value: 'en', child: Text('English')),
                ],
                onChanged: (value) {
                  ref.read(localeStateProvider.notifier).changeLocale(value!);
                },
                value: ref.watch(localeStateProvider).requireValue.languageCode,
                style: TextStyle(color: Colors.red)
              );
            },
          ),
          Text(context.l10n.helloWorld),
          CustomButton1(text: context.l10n.helloWorld, onPressed: () {}),
        ],
      ),
    );
  }
}
