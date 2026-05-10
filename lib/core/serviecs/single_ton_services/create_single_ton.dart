import 'package:depifinalproject/core/repo/images_repo/image_repo.dart';
import 'package:depifinalproject/core/repo/images_repo/image_repo_implemetation.dart';
import 'package:depifinalproject/core/serviecs/auth_services/fire_base_auth_services.dart';
import 'package:depifinalproject/core/serviecs/data_base_services/data_base_services.dart';
import 'package:depifinalproject/core/serviecs/data_base_services/fire_base_fire_store_services.dart';
import 'package:depifinalproject/core/serviecs/storage_services.dart/storage_servies.dart';
import 'package:depifinalproject/core/serviecs/storage_services.dart/supabase_storage_serviecs.dart';
import 'package:depifinalproject/feature/auth/data/repo/auth_repo_impltation.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';
import 'package:depifinalproject/feature/home/data/repo_impl/order_repo_impltation.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';
import 'package:depifinalproject/feature/home/domin/use_case/add_order_use_case.dart';
import 'package:depifinalproject/feature/home/domin/use_case/upload_order_image_use_case.dart';
import 'package:depifinalproject/feature/main_view/data/user_repo_impl/user_repo_impl.dart';
import 'package:depifinalproject/feature/main_view/domain/repo/user_repo.dart';
import 'package:depifinalproject/feature/main_view/domain/use_case/navigation_role_use_case.dart';
import 'package:depifinalproject/core/use_case/get_clinet_order_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/delete_order_by_clinet_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/up_data_order_data_by_clinet.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/update_order_image_by_clinet_use_case.dart';
import 'package:get_it/get_it.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Here we can register all our singleton services

  getIt.registerSingleton<FirebaseAuthServiecs>(FirebaseAuthServiecs());
  getIt.registerSingleton<UserRepo>(UserRepoImpl());
  getIt.registerSingleton<GetMainScreensUseCase>(
    GetMainScreensUseCase(getIt.get<UserRepo>()),
  );
  getIt.registerSingleton<StorageServiecs>(SupaBaseStorageServices());
  getIt.registerSingleton<DataBaseServies>(FireStoreServices());

  getIt.registerSingleton<OrderRepo>(
    OrderRepoImpltation(getIt.get<DataBaseServies>()),
  );

  getIt.registerSingleton<ImageRepo>(
    ImageRepoImplemetation(getIt.get<StorageServiecs>()),
  );

  getIt.registerSingleton<AddNewOrderUseCase>(
    AddNewOrderUseCase(getIt.get<OrderRepo>()),
  );
  getIt.registerSingleton<UploadOrderImageUseCase>(
    UploadOrderImageUseCase(getIt.get<ImageRepo>()),
  );
  getIt.registerSingleton<GetClinetOrderUseCase>(
    GetClinetOrderUseCase(getIt.get<OrderRepo>()),
  );
  getIt.registerSingleton<DeleteOrderByClinetUseCase>(
    DeleteOrderByClinetUseCase(getIt.get<OrderRepo>()),
  );
getIt.registerSingleton<UpDataOrderImageByClinetUseCase> (UpDataOrderImageByClinetUseCase(getIt.get<ImageRepo>()), );

  getIt.registerSingleton<UpDataOrderDataByClinet>(UpDataOrderDataByClinet(getIt.get<OrderRepo>()));

  

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      getIt.get<FirebaseAuthServiecs>(),
      getIt.get<DataBaseServies>(),
    ),
  );
}
