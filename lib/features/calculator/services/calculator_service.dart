import 'dart:math';

class CalculatorService {
  static const double petDensity = 1.38; // g/cm³
  static const double costPerGram = 2.5; // MXN
  static const int minutesPerGram = 4;

  static Map<String, dynamic> calculateQuotation(double volumeCm3, int quantity) {
    final double baseWeight = volumeCm3 * petDensity;
    final double totalWeight = baseWeight * quantity;
    final double totalCost = totalWeight * costPerGram;
    
    final String deliveryTime = quantity <= 10 ? '3 días hábiles' : '5 días hábiles';

    return {
      'weight': totalWeight,
      'cost': totalCost,
      'deliveryTime': deliveryTime,
      'volume': volumeCm3,
      'quantity': quantity,
    };
  }

  static Future<double> parseSTLVolume(List<int> fileBytes) async {
    // Simulate STL parsing delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Return random volume between 10.0 and 100.0 cm³
    final random = Random();
    return 10.0 + random.nextDouble() * 90.0;
  }

  // Legacy methods for basic calculator
  double add(double a, double b) => a + b;
  
  double subtract(double a, double b) => a - b;
  
  double multiply(double a, double b) => a * b;
  
  double divide(double a, double b) {
    if (b == 0) throw Exception('Division by zero');
    return a / b;
  }
}
