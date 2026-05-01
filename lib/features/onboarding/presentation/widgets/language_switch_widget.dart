import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/locale_state.dart';

class LanguageSwitchWidget extends ConsumerWidget {
  const LanguageSwitchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the current locale code
    final currentLocale = ref
        .watch(localeStateProvider)
        .requireValue
        .languageCode;

    return SizedBox(
      width: 150, // Added a width to keep the UI stable
      child: ShadSelect<String>(
        initialValue: currentLocale,
        // The display logic for the selected item in the button
        selectedOptionBuilder: (context, value) =>
            Text(value == 'ar' ? context.l10n.arabic : context.l10n.english),
        options: [
          ShadOption(value: 'ar', child: Text(context.l10n.arabic)),
          ShadOption(value: 'en', child: Text(context.l10n.english)),
        ],
        onChanged: (String? value) {
          if (value != null && value != currentLocale) {
            ref.read(localeStateProvider.notifier).changeLocale(value);
          }
        },
      ),
    );
  }
}
