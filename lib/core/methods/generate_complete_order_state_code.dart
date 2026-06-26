import 'dart:math';

String generateDeliveryCode() {
  final random = Random();
  return random.nextInt(100000).toString().padLeft(5, '0');
}
