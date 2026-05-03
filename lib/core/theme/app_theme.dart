import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../common/state/locale_state.dart';

part 'app_theme.g.dart';

@Riverpod(keepAlive: true)
AppTheme appTheme(Ref ref) => AppTheme(ref);

class AppTheme {
  final Ref ref;
  AppTheme(this.ref);

  Locale get locale => ref.watch(localeStateProvider).requireValue;

  // 1. Update this to accept the ColorScheme
  ShadThemeData _buildTheme(ShadColorScheme colorScheme) {
    return ShadThemeData(
      colorScheme: colorScheme,
      textTheme: ShadTextTheme.fromGoogleFont(
        locale.languageCode == 'ar' ? GoogleFonts.cairo : GoogleFonts.poppins,
      ),
      // 2. Now you can access colorScheme.muted or any other color
      selectTheme: ShadSelectTheme(
        decoration: ShadDecoration(
          color: colorScheme
              .muted, // This will be light gray in light mode, dark gray in dark mode
        ),
      ),
    );
  }

  // 3. Pass the specific Slate schemes into the builder
  ShadThemeData get lightTheme =>
      _buildTheme(const ShadStoneColorScheme.light());

  ShadThemeData get darkTheme => _buildTheme(const ShadStoneColorScheme.dark());
}
