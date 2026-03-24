class CustomExpetion implements Exception {
  final String message;

  CustomExpetion({required this.message});

  @override
  String toString() {
    return message;
  }
}