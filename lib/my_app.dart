import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/common/state/routes_state.dart';
import 'core/common/state/locale_state.dart';
import 'core/common/state/scaffold_messenger_key_state.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.read(appThemeProvider);
    final isDarkMode = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    return MaterialApp.router(
      scaffoldMessengerKey: ref.read(scaffoldMessengerKeyProvider),
      routerConfig: ref.read(routesProvider),
      debugShowCheckedModeBanner: false,
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Nudge Fit',
      locale: ref.watch(localeStateProvider).requireValue,
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
        FLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        // Limit text scaling to prevent UI breakage on devices with large system fonts.
        final mediaQuery = MediaQuery.of(context);

        return FTheme(
          data: isDarkMode ? appTheme.fDarkTheme : appTheme.fLightTheme,
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MediaQuery(
              data: mediaQuery.copyWith(textScaler: TextScaler.linear(1.0)),
              child: child ?? const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
