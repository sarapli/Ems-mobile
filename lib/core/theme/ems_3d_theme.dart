import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EMS3DTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0033A0),
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.arimo(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF0033A0),
      ),
      displayMedium: GoogleFonts.arimo(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF0033A0),
      ),
      bodyLarge: GoogleFonts.roboto(fontSize: 16, color: Colors.black87),
      bodyMedium: GoogleFonts.roboto(fontSize: 14, color: Colors.black54),
    ),
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0033A0),
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.arimo(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
      bodyMedium: GoogleFonts.roboto(fontSize: 14, color: Colors.white70),
    ),
    useMaterial3: true,
  );
}
