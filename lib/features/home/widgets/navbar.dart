import 'package:flutter/material.dart';

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
            title: Image.asset('assets/logopaleta.png', height: 40, fit: BoxFit.contain),
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
              const SizedBox(width: 16),
            ],
          );
        } else {
          // Mobile layout
          return AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Image.asset('assets/logopaleta.png', height: 40, fit: BoxFit.contain),
            actions: [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
            ],
          );
        }
      },
    );
  }
}
