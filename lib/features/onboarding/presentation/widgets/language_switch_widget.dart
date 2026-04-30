import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/locale_state.dart';

class LanguageSwitchWidget extends StatelessWidget {
  const LanguageSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final currentLocale = ref
            .watch(localeStateProvider)
            .requireValue
            .languageCode;
        return SizedBox(
          width: 130,
          child: FSelect<String>(
            hint: currentLocale == 'ar'
                ? context.l10n.arabic
                : context.l10n.english,
            items: {context.l10n.arabic: 'ar', context.l10n.english: 'en'},
            control: FSelectControl.lifted(
              value: currentLocale,
              onChange: (value) {
                if (value != null && value != currentLocale) {
                  ref.read(localeStateProvider.notifier).changeLocale(value);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
