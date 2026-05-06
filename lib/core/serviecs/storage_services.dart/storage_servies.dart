import 'dart:io';

abstract class StorageServiecs {
  Future<String> upLoadFile(File file, String pathUrl);
}
