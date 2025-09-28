import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EMS3DTheme {
  // EMS Brand Palette
  static const Color emsBlue = Color(0xFF0033A0); // EMS blue
  static const Color emsOrange = Color(0xFFF7941D); // EMS orange (aile)
  static const Color emsNavy = Color(0xFF0D1B2A);
  static const Color emsSurface = Color(0xFFF7F9FC);

  static TextTheme _textTheme(Brightness brightness) {
    final baseColor = brightness == Brightness.light ? Colors.black87 : Colors.white;
    final secondary = brightness == Brightness.light ? Colors.black54 : Colors.white70;
    return TextTheme(
      displayLarge: GoogleFonts.arimo(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.italic,
        color: emsBlue,
      ),
      displayMedium: GoogleFonts.arimo(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
        color: emsBlue,
      ),
      headlineMedium: GoogleFonts.arimo(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: baseColor,
      ),
      titleMedium: GoogleFonts.arimo(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: baseColor,
      ),
      bodyLarge: GoogleFonts.roboto(fontSize: 16, color: baseColor),
      bodyMedium: GoogleFonts.roboto(fontSize: 14, color: secondary),
      labelLarge: GoogleFonts.arimo(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  static ColorScheme _scheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: emsBlue,
      onPrimary: Colors.white,
      secondary: emsOrange,
      onSecondary: Colors.black,
      error: const Color(0xFFB00020),
      onError: Colors.white,
      surface: brightness == Brightness.light ? Colors.white : const Color(0xFF17253A),
      onSurface: brightness == Brightness.light ? Colors.black : Colors.white,
      surfaceContainerHighest: brightness == Brightness.light ? const Color(0xFFE5ECFF) : const Color(0xFF2A3B57),
      onSurfaceVariant: brightness == Brightness.light ? Colors.black87 : Colors.white70,
      tertiary: const Color(0xFF0175C2),
      onTertiary: Colors.white,
      outline: brightness == Brightness.light ? const Color(0xFFE5ECFF) : const Color(0xFF3B4A66),
    );
  }

  static final ThemeData lightTheme = ThemeData(
    colorScheme: _scheme(Brightness.light),
    scaffoldBackgroundColor: emsSurface,
    textTheme: _textTheme(Brightness.light),
    iconTheme: const IconThemeData(color: emsBlue, size: 22),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      foregroundColor: Colors.white,
      centerTitle: false,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 22, vertical: 14)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
        backgroundColor: const WidgetStatePropertyAll(emsBlue),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        elevation: const WidgetStatePropertyAll(8),
        shadowColor: WidgetStatePropertyAll(emsBlue.withValues(alpha: 0.35)),
        textStyle: WidgetStatePropertyAll(GoogleFonts.arimo(fontWeight: FontWeight.w700)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFE5ECFF))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFE5ECFF))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: emsBlue, width: 1.6)),
      labelStyle: GoogleFonts.roboto(color: Colors.black87),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 10,
      shadowColor: emsBlue.withValues(alpha: 0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Color(0xFFE5ECFF))),
    ),
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: _scheme(Brightness.dark),
    scaffoldBackgroundColor: emsNavy,
    textTheme: _textTheme(Brightness.dark),
    iconTheme: const IconThemeData(color: Colors.white, size: 22),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      foregroundColor: Colors.white,
      centerTitle: false,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 22, vertical: 14)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
        backgroundColor: const WidgetStatePropertyAll(emsBlue),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
        elevation: const WidgetStatePropertyAll(6),
        shadowColor: WidgetStatePropertyAll(Colors.black.withValues(alpha: 0.5)),
        textStyle: WidgetStatePropertyAll(GoogleFonts.arimo(fontWeight: FontWeight.w700)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF0F2238),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFF2A3B57))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFF2A3B57))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.white, width: 1.4)),
      labelStyle: GoogleFonts.roboto(color: Colors.white70),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF17253A),
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.35),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: const BorderSide(color: Color(0xFF2A3B57))),
    ),
    useMaterial3: true,
  );
}
