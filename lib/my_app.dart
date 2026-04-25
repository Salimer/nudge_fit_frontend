import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/state/go_router_state.dart';
import 'core/state/locale_state.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.read(appThemeProvider);
    return MaterialApp.router(
      routerConfig: ref.read(routesProvider),
      debugShowCheckedModeBanner: false,
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Nudge Fit',
      locale: ref.watch(localeStateProvider).requireValue,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
