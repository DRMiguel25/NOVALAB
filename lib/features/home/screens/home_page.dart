import 'package:flutter/material.dart';
import '../widgets/animated_hero_section.dart';
import '../widgets/navbar.dart';
import '../widgets/about_widget.dart';
import '../../calculator/widgets/calculator_widget.dart';
import '../../calculator/widgets/product_description_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey calculatorKey = GlobalKey();
  final GlobalKey descriptionKey = GlobalKey();

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
            ListTile(
              leading: const Icon(Icons.description, color: Color(0xFF00FF87)),
              title: const Text('Describir Idea', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Scrollable.ensureVisible(
                  descriptionKey.currentContext!,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined, color: Color(0xFF00FF87))
                  .animate(onPlay: (controller) => controller.repeat(reverse: true))
                  .scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2), duration: 800.ms),
              title: const Text('Instagram', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                final url = Uri.parse('https://www.instagram.com/nova_lab_print?igsh=MTc4bXpkZnBzMHJjeQ==');
                launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 60, // Subtract AppBar height
              child: AnimatedHeroSection(
                onQuotePressed: () {
                  if (calculatorKey.currentContext != null) {
                    Scrollable.ensureVisible(
                      calculatorKey.currentContext!,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
            Container(key: aboutKey, child: const AboutWidget()),
            Container(key: calculatorKey, child: const CalculatorWidget()),
            Container(key: descriptionKey, child: const ProductDescriptionWidget()),
          ],
        ),
      ),
    );
  }
}
