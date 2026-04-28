import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  Widget _buildInfoCard(BuildContext context, String title, String content) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color(0xFF00FF87),
          width: 1,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: const Color(0xFF00FF87),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueCard(BuildContext context, String title, String description) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color(0xFF00FF87),
          width: 0.5,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: const Color(0xFF00FF87),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Text(
            'Estructura Ideológica',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          
          // Mission and Vision cards
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 768) {
                // Desktop layout - side by side
                return Row(
                  children: [
                    Expanded(
                      child: _buildInfoCard(context, 'Misión', AppConstants.mission),
                    ),
                    Expanded(
                      child: _buildInfoCard(context, 'Visión', AppConstants.vision),
                    ),
                  ],
                );
              } else {
                // Mobile layout - stacked
                return Column(
                  children: [
                    _buildInfoCard(context, 'Misión', AppConstants.mission),
                    _buildInfoCard(context, 'Visión', AppConstants.vision),
                  ],
                );
              }
            },
          ),
          
          const SizedBox(height: 32),
          
          // Values section
          Text(
            'Nuestros Valores',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          
          // Values grid
          Wrap(
            alignment: WrapAlignment.center,
            children: AppConstants.values.map((value) {
              return Container(
                constraints: const BoxConstraints(maxWidth: 350),
                child: _buildValueCard(
                  context,
                  value['title']!,
                  value['description']!,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
