import 'package:uuid/uuid.dart';

String generateUID() {
  return const Uuid().v4();
}