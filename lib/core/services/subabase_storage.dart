import 'dart:io';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SubabaseStorageService implements StorageService {
  static late SupabaseClient  _supabase;
  static createBuckets() async {
    final existingBuckets = await _supabase.storage.listBuckets();
    final exists =
        existingBuckets.any((bucket) => bucket.id == BackendEndpoint.images);
    if (!exists) {
      await _supabase.storage.createBucket(BackendEndpoint.images);
    }
  }

  static initSupabase() async {
   await Supabase.initialize(
      url: BackendEndpoint.subabaseUrl,
      anonKey: BackendEndpoint.supabaseKey,
    );
    _supabase = Supabase.instance.client;
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var fileReference = await _supabase.storage
        .from(BackendEndpoint.images)
        .upload('$path/$fileName.$extensionName', file);
    return fileReference;
  }
}
