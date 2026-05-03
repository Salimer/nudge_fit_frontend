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

  ShadThemeData _buildTheme(ShadColorScheme colorScheme) {
    return ShadThemeData(
      colorScheme: colorScheme,
      textTheme: ShadTextTheme.fromGoogleFont(
        locale.languageCode == 'ar' ? GoogleFonts.cairo : GoogleFonts.poppins,
      ),
      selectTheme: ShadSelectTheme(
        decoration: ShadDecoration(color: colorScheme.muted),
      ),
    );
  }

  ShadThemeData get lightTheme =>
      _buildTheme(const ShadStoneColorScheme.light());

  ShadThemeData get darkTheme => _buildTheme(const ShadStoneColorScheme.dark());
}
