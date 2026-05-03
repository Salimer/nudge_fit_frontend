import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'core/common/state/routes_state.dart';
import 'core/common/state/locale_state.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.read(appThemeProvider);
    return ShadApp.router(
      title: 'Nudge Fit',
      routerConfig: ref.read(routesProvider),
      locale: ref.watch(localeStateProvider).requireValue,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: ThemeMode.system,
      builder: (context, child) {
        // Limit text scaling to prevent UI breakage on devices with large system fonts.
        // You can change `maxScaleFactor: 1.2` to `maxScaleFactor: 1.0` (or use `TextScaler.noScaling`)
        // to completely disable scaling if you want the exact same font size everywhere.
        final mediaQuery = MediaQuery.of(context);

        return GestureDetector(
          onTap: () {
            // Unfocus the current focus node when the user taps outside of a text field.
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MediaQuery(
            data: mediaQuery.copyWith(textScaler: TextScaler.linear(1.0)),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
