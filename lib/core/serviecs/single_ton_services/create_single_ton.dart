import 'package:depifinalproject/core/serviecs/auth_services/fire_base_auth_services.dart';
import 'package:depifinalproject/core/serviecs/data_base_services/data_base_services.dart';
import 'package:depifinalproject/core/serviecs/data_base_services/fire_base_fire_store_services.dart';
import 'package:depifinalproject/feature/auth/data/repo/auth_repo_impltation.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Here we can register all our singleton services

  getIt.registerSingleton<FirebaseAuthServiecs>(FirebaseAuthServiecs());
  getIt.registerSingleton<DataBaseServies>(FireStoreServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      getIt.get<FirebaseAuthServiecs>(),
      getIt.get<DataBaseServies>(),
    ),
  );
}
