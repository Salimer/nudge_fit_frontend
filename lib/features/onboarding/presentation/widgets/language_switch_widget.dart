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

    return ShadSelect<String>(
      maxWidth: 150,
      initialValue: currentLocale,
      selectedOptionBuilder: (context, value) => Text(
        value == 'ar' ? context.l10n.arabic : context.l10n.english,
        style: ShadTheme.of(context).textTheme.p,
      ),
      options: [
        ShadOption(
          value: 'ar',
          child: Text(
            context.l10n.arabic,
            style: ShadTheme.of(context).textTheme.p,
          ),
        ),
        ShadOption(
          value: 'en',
          child: Text(
            context.l10n.english,
            style: ShadTheme.of(context).textTheme.p,
          ),
        ),
      ],
      onChanged: (String? value) {
        if (value != null && value != currentLocale) {
          ref.read(localeStateProvider.notifier).changeLocale(value);
        }
      },
    );
  }
}
