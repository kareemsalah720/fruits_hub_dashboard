import 'package:fruits_hub_dashboard/core/repos/images/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images/images_repo_imp.dart';
import 'package:fruits_hub_dashboard/core/repos/products/products_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products/products_repo_imp.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/subabase_storage.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageService>(SubabaseStorageService());
   GetIt.instance.registerSingleton<DatabaseService>(FirestoreService());
   getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(getIt.get<StorageService>()));
     
   getIt.registerSingleton<ProductsRepo>(
      ProductsRepoImpl(getIt.get<DatabaseService>()));

}
