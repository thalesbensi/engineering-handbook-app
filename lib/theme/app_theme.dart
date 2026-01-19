import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _seedColor = Color(0xFF1B2A3A);
  static const surface = Color(0xFFF6F2EA);
  static const background = Color(0xFFF2EEE6);

  static ThemeData get lightTheme {
    final textTheme = GoogleFonts.ibmPlexSansTextTheme(
      ThemeData(brightness: Brightness.light).textTheme,
    );

    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _seedColor,
        surface: surface,
        background: background,
      ),
      textTheme: textTheme.copyWith(
        displayLarge: GoogleFonts.tinos(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          height: 1.1,
          color: const Color(0xFF13202D),
        ),
        headlineSmall: GoogleFonts.tinos(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF13202D),
        ),
      ),
      useMaterial3: true,
    );
  }
}
