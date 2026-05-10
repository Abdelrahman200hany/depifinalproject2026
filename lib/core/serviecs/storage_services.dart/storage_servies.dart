import 'dart:io';

abstract class StorageServiecs {
  Future<String> upLoadFile(File file, String pathUrl);
  Future<void> deleteFile(String fileUrl);
  Future<String> upDateFile(File file, String oldFileUrl);
}
