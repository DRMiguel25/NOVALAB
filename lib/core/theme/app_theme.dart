import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get ecoTechTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0B132B),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF00FF87),
        secondary: Color(0xFF00FF87),
        surface: Color(0xFF1C2541),
        onPrimary: Color(0xFF0B132B),
        onSecondary: Color(0xFF0B132B),
        onSurface: Color(0xFFFFFFFF),
      ),
      textTheme: GoogleFonts.montserratTextTheme().copyWith(
        displayLarge: GoogleFonts.syncopate(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.syncopate(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.inter(
          color: Colors.white.withOpacity(0.9),
          fontSize: 16,
        ),
        bodyMedium: GoogleFonts.inter(
          color: Colors.white.withOpacity(0.8),
          fontSize: 14,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00FF87),
          foregroundColor: const Color(0xFF0B132B),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
