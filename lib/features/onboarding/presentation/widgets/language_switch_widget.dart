import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/state/locale_state.dart';

class LanguageSwitchWidget extends StatelessWidget {
  const LanguageSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return DropdownButton(
          items: [
            DropdownMenuItem(value: 'ar', child: Text(context.l10n.arabic)),
            DropdownMenuItem(value: 'en', child: Text(context.l10n.english)),
          ],
          onChanged: (value) {
            ref.read(localeStateProvider.notifier).changeLocale(value!);
          },
          value: ref.watch(localeStateProvider).requireValue.languageCode,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
        );
      },
    );
  }
}
