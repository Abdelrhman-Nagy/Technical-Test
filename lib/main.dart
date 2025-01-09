import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocabulary/View/onboarding_view.dart';

ThemeMode themeMode = ThemeMode.system;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF262626),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF93c1c1)),
        cardColor: Color(0xFF363636),
        textTheme: TextTheme(
            titleLarge: GoogleFonts.dmSerifText(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            titleMedium: GoogleFonts.inter(fontSize: 15, color: Colors.white)),
        useMaterial3: true,
      ),
      title: 'Flutter Demo',
      themeMode: themeMode,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFefebe0),
        cardColor: Colors.white,
        textTheme: TextTheme(
            titleLarge: GoogleFonts.dmSerifText(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
            titleMedium: GoogleFonts.inter(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF93c1c1)),
        useMaterial3: true,
      ),
      home: OnboardingScreen(),
    );
  }
}
