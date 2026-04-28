import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../services/calculator_service.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String? selectedFileName;
  bool isLoading = false;
  Map<String, dynamic>? quoteResult;
  int pieceQuantity = 2;
  double? currentVolume;

  void _updateQuotation() {
    if (currentVolume != null) {
      final quotation = CalculatorService.calculateQuotation(currentVolume!, pieceQuantity);
      setState(() {
        quoteResult = quotation;
      });
    }
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['stl'],
    );

    if (result != null && result.files.single.name != null) {
      setState(() {
        selectedFileName = result.files.single.name;
        isLoading = true;
        quoteResult = null;
      });

      try {
        final fileBytes = result.files.single.bytes;
        if (fileBytes != null) {
          final volume = await CalculatorService.parseSTLVolume(fileBytes);
          
          setState(() {
            currentVolume = volume;
            isLoading = false;
          });
          
          _updateQuotation();
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            'Cotiza nuestro Servicio',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF00FF87),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.upload_file,
                  size: 64,
                  color: Color(0xFF00FF87),
                ),
                const SizedBox(height: 16),
                Text(
                  'Sube tu archivo .STL',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '¿Qué es un .STL? Es el formato estándar para impresión 3D que contiene la geometría tridimensional de tu modelo.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: pickFile,
                  child: const Text('Seleccionar Archivo'),
                ),
                if (isLoading) ...[
                  const SizedBox(height: 16),
                  const CircularProgressIndicator(
                    color: Color(0xFF00FF87),
                  ),
                ],
                if (selectedFileName != null && !isLoading) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Archivo seleccionado: $selectedFileName',
                    style: const TextStyle(
                      color: Color(0xFF00FF87),
                      fontSize: 16,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cantidad de piezas (Pares): ',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              IconButton(
                onPressed: () {
                  if (pieceQuantity > 2) {
                    setState(() {
                      pieceQuantity = pieceQuantity - 2;
                    });
                    _updateQuotation();
                  }
                },
                icon: const Icon(
                  Icons.remove,
                  color: Color(0xFF00FF87),
                ),
              ),
              Text(
                '$pieceQuantity',
                style: const TextStyle(
                  color: Color(0xFF00FF87),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    pieceQuantity = pieceQuantity + 2;
                  });
                  _updateQuotation();
                },
                icon: const Icon(
                  Icons.add,
                  color: Color(0xFF00FF87),
                ),
              ),
            ],
          ),
          if (quoteResult != null) ...[
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF00FF87),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Resultados de Cotización',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF00FF87),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildResultRow('Volumen:', '${quoteResult!['volume'].toStringAsFixed(2)} cm³'),
                  _buildResultRow('Peso:', '${quoteResult!['weight'].toStringAsFixed(2)} g'),
                  _buildResultRow('Costo Estimado:', '\$${quoteResult!['cost'].toStringAsFixed(2)} MXN'),
                  _buildResultRow('Tiempo de Entrega:', '${quoteResult!['deliveryTime']}'),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00FF87).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.eco,
                          color: Color(0xFF00FF87),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Impacto Ecológico: ${quoteResult!['weight'].toStringAsFixed(1)}g de PET reciclado',
                            style: const TextStyle(
                              color: Color(0xFF00FF87),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF00FF87),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
