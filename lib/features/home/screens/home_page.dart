import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart';
import '../widgets/about_widget.dart';
import '../../calculator/widgets/calculator_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey calculatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveNavBar(aboutKey: aboutKey, calculatorKey: calculatorKey),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFF00FF87).withOpacity(0.1),
              ),
              child: Image.asset('assets/logopaleta.png', height: 40),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Color(0xFF00FF87)),
              title: const Text('Nosotros', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Scrollable.ensureVisible(
                  aboutKey.currentContext!,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate, color: Color(0xFF00FF87)),
              title: const Text('Cotizador 3D', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Scrollable.ensureVisible(
                  calculatorKey.currentContext!,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            Container(key: aboutKey, child: const AboutWidget()),
            Container(key: calculatorKey, child: const CalculatorWidget()),
          ],
        ),
      ),
    );
  }
}
