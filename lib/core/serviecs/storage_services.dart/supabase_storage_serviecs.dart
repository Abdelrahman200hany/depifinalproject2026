import 'dart:io';

import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/generate_uid.dart';
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

  /// i add generate id fun as if i want to upload the same image
  /// if i don't write it i can't upload the same photo
  /// the same path is same in both image
  /// and before the extension as any image shoud end with .png / .gpg /. svg
  @override
  Future<String> upLoadFile(File file, String pathUrl) async {
    final String uid = generateUID();
    String fileName = b.basenameWithoutExtension(file.path);
    String extension = b.extension(file.path);
    await _supabase.client.storage
        .from(kImagesBuket)
        .upload('$pathUrl/$fileName-$uid$extension', file);

    final String fileUrl = _supabase.client.storage
        .from(kImagesBuket)
        .getPublicUrl('$pathUrl/$fileName-$uid$extension');
    return fileUrl;
  }

  @override
  Future<void> deleteFile(String fileUrl) async {
    final uri = Uri.parse(fileUrl);
    final pathSegments = uri.pathSegments;
    // الـ path بيكون بعد اسم الـ bucket
    final bucketIndex = pathSegments.indexOf(kImagesBuket);
    final filePath = pathSegments.sublist(bucketIndex + 1).join('/');
    await _supabase.client.storage.from(kImagesBuket).remove([filePath]);
  }

  // get the url file from the object
  // then then override the file in same url but
  // in flitter if same url and diffrent file he do not hear the changes as
  // he save the changes in chace momery  so that
  // an each update proccess of image we also updata image version
  // and use cached network image to handel both version  like https:/52245.png if it be https:/52245.png?-1
  // this is not diffrent path the base is still same but must not push this to subabasse or firestore
  // only we use this  in widget ui

  @override
  Future<String> upDateFile(File file, String oldFileUrl) async {
    final uri = Uri.parse(oldFileUrl);
    final bucketIndex = uri.pathSegments.indexOf(kImagesBuket);
    final oldFilePath = uri.pathSegments.sublist(bucketIndex + 1).join('/');

    // بتحل محل الـ file القديمة على نفس الـ path
    await _supabase.client.storage.from(kImagesBuket).update(oldFilePath, file);

    final String fileUrl = _supabase.client.storage
        .from(kImagesBuket)
        .getPublicUrl(oldFilePath);

    return fileUrl;
  }
}
