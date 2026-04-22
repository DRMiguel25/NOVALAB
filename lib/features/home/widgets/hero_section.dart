import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Container(
      height: screenHeight * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', height: 180),
          const SizedBox(height: 24),
          Text(
            AppConstants.slogan,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Utilizamos filamento de PET 100% reciclado para apoyar la economía circular y la accesibilidad tecnológica.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {
              // TODO: Navigate to quote page
            },
            child: const Text('Cotizar Impresión 3D'),
          ),
        ],
      ),
    );
  }
}
