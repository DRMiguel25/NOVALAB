import 'package:flutter/material.dart';
import 'features/home/screens/home_page.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Novalab App',
      theme: AppTheme.ecoTechTheme,
      home: const HomePage(),
    );
  }
}
