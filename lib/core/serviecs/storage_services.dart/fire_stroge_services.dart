import 'dart:io';

import 'package:depifinalproject/core/serviecs/storage_services.dart/storage_servies.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageServiecs {
  final stroageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> upLoadFile(File file, String pathUrl) async {
    String fileName = b.basename(file.path);
    String extension = b.extension(file.path);
    var fileRef = stroageReference.child('$pathUrl/$fileName.$extension');
    await fileRef.putFile(file);
    String fileUrl = await fileRef.getDownloadURL();
    return fileUrl;
  }
}
