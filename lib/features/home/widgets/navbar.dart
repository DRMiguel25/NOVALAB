import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ResponsiveNavBar extends StatelessWidget implements PreferredSizeWidget {
  const ResponsiveNavBar({
    super.key,
    required this.aboutKey,
    required this.calculatorKey,
  });

  final GlobalKey aboutKey;
  final GlobalKey calculatorKey;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          // Desktop/Web layout
          return AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Image.asset('assets/logopaleta.png', height: 50, fit: BoxFit.contain),
            actions: [
              TextButton(
                onPressed: () {
                  Scrollable.ensureVisible(
                    aboutKey.currentContext!,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  'Nosotros',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  Scrollable.ensureVisible(
                    calculatorKey.currentContext!,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  'Cotizador 3D',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () async {
                  final url = Uri.parse('https://www.instagram.com/nova_lab_print?igsh=MTc4bXpkZnBzMHJjeQ==');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
                tooltip: 'Instagram',
              ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2), duration: 800.ms),
              const SizedBox(width: 16),
            ],
          );
        } else {
          // Mobile layout
          return AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Image.asset('assets/logopaleta.png', height: 50, fit: BoxFit.contain),
            actions: [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
