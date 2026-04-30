import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../common/state/locale_state.dart';

part 'app_theme.g.dart';

@Riverpod(keepAlive: true)
AppTheme appTheme(Ref ref) => AppTheme(ref);

class AppTheme {
  final Ref ref;
  AppTheme(this.ref);

  Locale get locale => ref.watch(localeStateProvider).requireValue;

  ThemeData buildTheme() {
    return ThemeData(
      useMaterial3: true,
    );
  }

  ThemeData get lightTheme => buildTheme();
  ThemeData get darkTheme => buildTheme();
  
  FThemeData get fLightTheme => FThemes.neutral.light.desktop;
  FThemeData get fDarkTheme => FThemes.neutral.dark.desktop;
}
