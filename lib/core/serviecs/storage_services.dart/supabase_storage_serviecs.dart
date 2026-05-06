import 'dart:io';

import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/serviecs/storage_services.dart/storage_servies.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseStorageServices implements StorageServiecs {
  static late Supabase _supabase;

  static Future initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupaseBaseUrl,
      anonKey: kSupaseBaseKey,
    );
  }

  // to create bucket insteal of create one in dashBoard
  static Future createBuckets(String bucketName) async {
    List<Bucket> buckets = await _supabase.client.storage.listBuckets();
    bool isBucketISexits = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketISexits = true;
        break;
      }
    }
    if (!isBucketISexits) {
      _supabase.client.storage.createBucket(bucketName);
    }
  }

  // to upload file and get the  url of file

  @override
  Future<String> upLoadFile(File file, String pathUrl) async {
    String fileName = b.basename(file.path);
    String extension = b.extension(file.path);
    await _supabase.client.storage
        .from(kImagesBuket)
        .upload('$pathUrl/$fileName.$extension', file);
    final String fileUrl = _supabase.client.storage
        .from(kImagesBuket)
        .getPublicUrl('$pathUrl/$fileName.$extension');
    return fileUrl;
  }
}
