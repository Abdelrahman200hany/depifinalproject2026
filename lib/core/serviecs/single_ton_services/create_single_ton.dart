import 'package:depifinalproject/core/repo/images_repo/image_repo.dart';
import 'package:depifinalproject/core/repo/images_repo/image_repo_implemetation.dart';
import 'package:depifinalproject/core/serviecs/auth_services/fire_base_auth_services.dart';
import 'package:depifinalproject/core/serviecs/data_base_services/data_base_services.dart';
import 'package:depifinalproject/core/serviecs/data_base_services/fire_base_fire_store_services.dart';
import 'package:depifinalproject/core/serviecs/storage_services.dart/storage_servies.dart';
import 'package:depifinalproject/core/serviecs/storage_services.dart/supabase_storage_serviecs.dart';
import 'package:depifinalproject/feature/auth/data/repo/auth_repo_impltation.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';
import 'package:depifinalproject/feature/auth/domain/use_casse/refrech_user_data_use_case.dart';
import 'package:depifinalproject/feature/auth/domain/use_casse/send_password_reset_email_use_case.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/referch_user_data/refresh_user_data_cubit.dart';
import 'package:depifinalproject/feature/auth/presentation/manager/sent_password_reset_email/sent_password_reset_email_cubit.dart';
import 'package:depifinalproject/feature/home/data/repo_impl/order_repo_impltation.dart';
import 'package:depifinalproject/feature/home/domin/repo/order_repo.dart';
import 'package:depifinalproject/feature/home/domin/use_case/add_order_use_case.dart';
import 'package:depifinalproject/feature/home/domin/use_case/upload_order_image_use_case.dart';
import 'package:depifinalproject/feature/main_view/data/user_repo_impl/user_repo_impl.dart';
import 'package:depifinalproject/feature/main_view/domain/repo/user_repo.dart';
import 'package:depifinalproject/feature/main_view/domain/use_case/navigation_role_use_case.dart';
import 'package:depifinalproject/core/use_case/get_clinet_order_use_case.dart';
import 'package:depifinalproject/feature/offers/domain/use_case/accept_delivery_offer_use_case.dart';
import 'package:depifinalproject/feature/offers/domain/use_case/get_accepted_delivery_offers_use_case%20.dart';
import 'package:depifinalproject/feature/offers/domain/use_case/update_delivery_data_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/add_offer_to_order_by_delivey_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/delete_order_by_clinet_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/get_all_clinet_order_with_offers_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/get_all_offers_related_to_orders_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/get_all_orders_for_delivery_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/up_data_order_data_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/update_order_image_by_clinet_use_case.dart';
import 'package:depifinalproject/feature/orders/domain/use_case/update_simple_order_data_use_case.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/cubit/orders_report_cubit.dart';
import 'package:depifinalproject/feature/profile/data/repo_implementation/rate_repo_impltation.dart';
import 'package:depifinalproject/feature/profile/domain/repo/rate_repo.dart';
import 'package:depifinalproject/feature/profile/domain/use_case/add_rate_use_case.dart';
import 'package:depifinalproject/feature/profile/domain/use_case/get_rates_use_case.dart';
import 'package:depifinalproject/feature/profile/domain/use_case/read_user_data_use_case.dart';
import 'package:depifinalproject/feature/profile/domain/use_case/update_specific_user_data_use_case.dart';
import 'package:depifinalproject/feature/profile/domain/use_case/update_user_data_use_case.dart';
import 'package:depifinalproject/feature/profile/domain/use_case/upload_profile_image_use_case.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/GetRates/get_rates_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/add_rate/add_rate_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/get_ratess_tatistics/get_rates_statistics_state.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/update_specific_user_data/update_specific_user_data_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/update_user_profile_data/update_user_data_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/upload_image_profile/upload_image_profile_dart_cubit.dart';
import 'package:depifinalproject/feature/validation/data/repo_impl/validation_request_repo_impl.dart';
import 'package:depifinalproject/feature/validation/domin/repo/validation_request_repo.dart';
import 'package:depifinalproject/feature/validation/domin/use_case/add_validation_request_use_case.dart';
import 'package:depifinalproject/feature/validation/domin/use_case/approve_validation_request_use_case.dart';
import 'package:depifinalproject/feature/validation/domin/use_case/get_validation_request_use_case.dart';
import 'package:depifinalproject/feature/validation/domin/use_case/get_waiting_validation_requests_use_case.dart';
import 'package:depifinalproject/feature/validation/domin/use_case/update_validation_request_use_case.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/add_validation_request/add_validation_request_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/approve_validation_request/approve_validation_request_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/get_validation_request/get_validation_request_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/get_waiting_validation_requests/get_waiting_validation_requests_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/manager/update_validation_request/update_validation_request_cubit.dart';

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
  getIt.registerSingleton<UpDataOrderImageByClinetUseCase>(
    UpDataOrderImageByClinetUseCase(getIt.get<ImageRepo>()),
  );

  getIt.registerSingleton<GetAllOrdersForDeliveryUseCase>(
    GetAllOrdersForDeliveryUseCase(getIt.get<OrderRepo>()),
  );

  getIt.registerSingleton<UpDataOrderDataUseCase>(
    UpDataOrderDataUseCase(getIt.get<OrderRepo>()),
  );
  getIt.registerSingleton<AddDeliveryOfferUseCase>(
    AddDeliveryOfferUseCase(getIt.get<OrderRepo>()),
  );
  getIt.registerSingleton<GetAllOffersRelatedToOrderUseCase>(
    GetAllOffersRelatedToOrderUseCase(getIt.get<OrderRepo>()),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      getIt.get<FirebaseAuthServiecs>(),
      getIt.get<DataBaseServies>(),
    ),
  );
  getIt.registerSingleton<UpdateDeliveryDataUseCase>(
    UpdateDeliveryDataUseCase(getIt.get<OrderRepo>()),
  );
  getIt.registerSingleton<GetAllClientOrdersWithOffersUseCase>(
    GetAllClientOrdersWithOffersUseCase(
      getIt.get<GetClinetOrderUseCase>(),
      getIt.get<GetAllOffersRelatedToOrderUseCase>(),
    ),
  );
  getIt.registerSingleton<UpdateSimpleOrderDataUseCase>(
    UpdateSimpleOrderDataUseCase(getIt.get<OrderRepo>()),
  );
  getIt.registerSingleton<AcceptDeliveryOfferUseCase>(
    AcceptDeliveryOfferUseCase(
      getIt.get<UpDataOrderDataUseCase>(),
      getIt.get<UpdateDeliveryDataUseCase>(),
    ),
  );
  getIt.registerSingleton<GetAcceptedDeliveryOffersUseCase>(
    GetAcceptedDeliveryOffersUseCase(getIt.get<OrderRepo>()),
  );
  getIt.registerSingleton<ReadUserDataUseCase>(
    ReadUserDataUseCase(getIt.get<AuthRepo>()),
  );
  getIt.registerSingleton<UpdateUserDataUseCase>(
    UpdateUserDataUseCase(getIt.get<AuthRepo>()),
  );
  getIt.registerFactory<UpdateUserCubit>(
    () => UpdateUserCubit(getIt.get<UpdateUserDataUseCase>()),
  );
  getIt.registerSingleton<UploadProfileImageUseCase>(
    UploadProfileImageUseCase(getIt.get<ImageRepo>()),
  );

  getIt.registerFactory<UploadProfileImageCubit>(
    () => UploadProfileImageCubit(getIt.get<UploadProfileImageUseCase>()),
  );
  getIt.registerSingleton<RateRepo>(RateRepoImpl(getIt.get<DataBaseServies>()));
  getIt.registerSingleton<AddRateUseCase>(
    AddRateUseCase(getIt.get<RateRepo>()),
  );

  getIt.registerSingleton<GetRatesUseCase>(
    GetRatesUseCase(getIt.get<RateRepo>()),
  );
  getIt.registerFactory<AddRateCubit>(
    () => AddRateCubit(getIt.get<AddRateUseCase>()),
  );

  getIt.registerFactory<GetRatesCubit>(
    () => GetRatesCubit(getIt.get<GetRatesUseCase>()),
  );
  getIt.registerSingleton<ValidationRequestRepo>(
    ValidationRequestRepoImpl(getIt.get<DataBaseServies>()),
  );

  getIt.registerSingleton<AddValidationRequestUseCase>(
    AddValidationRequestUseCase(getIt.get<ValidationRequestRepo>()),
  );

  getIt.registerSingleton<GetValidationRequestUseCase>(
    GetValidationRequestUseCase(getIt.get<ValidationRequestRepo>()),
  );

  getIt.registerSingleton<GetWaitingValidationRequestsUseCase>(
    GetWaitingValidationRequestsUseCase(getIt.get<ValidationRequestRepo>()),
  );

  getIt.registerSingleton<UpdateValidationRequestUseCase>(
    UpdateValidationRequestUseCase(getIt.get<ValidationRequestRepo>()),
  );

  getIt.registerFactory<AddValidationRequestCubit>(
    () => AddValidationRequestCubit(getIt.get<AddValidationRequestUseCase>()),
  );

  getIt.registerFactory<GetValidationRequestCubit>(
    () => GetValidationRequestCubit(getIt.get<GetValidationRequestUseCase>()),
  );

  getIt.registerFactory<GetWaitingValidationRequestsCubit>(
    () => GetWaitingValidationRequestsCubit(
      getIt.get<GetWaitingValidationRequestsUseCase>(),
    ),
  );

  getIt.registerFactory<UpdateValidationRequestCubit>(
    () => UpdateValidationRequestCubit(
      getIt.get<UpdateValidationRequestUseCase>(),
    ),
  );

  getIt.registerSingleton<UpdateSpecificUserDataUseCase>(
    UpdateSpecificUserDataUseCase(getIt.get<AuthRepo>()),
  );

  getIt.registerFactory<UpdateSpecificUserDataCubit>(
    () =>
        UpdateSpecificUserDataCubit(getIt.get<UpdateSpecificUserDataUseCase>()),
  );
  getIt.registerSingleton<ApproveValidationRequestUseCase>(
    ApproveValidationRequestUseCase(
      getIt.get<UpdateValidationRequestUseCase>(),

      getIt.get<UpdateSpecificUserDataUseCase>(),
    ),
  );

  getIt.registerFactory<ApproveValidationRequestCubit>(
    () => ApproveValidationRequestCubit(
      getIt.get<ApproveValidationRequestUseCase>(),
    ),
  );
  getIt.registerSingleton<RefreshUserDataUseCase>(
    RefreshUserDataUseCase(getIt.get<AuthRepo>()),
  );

  getIt.registerFactory<RefreshUserDataCubit>(
    () => RefreshUserDataCubit(getIt.get<RefreshUserDataUseCase>()),
  );
  getIt.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(getIt.get<AuthRepo>()),
  );

  getIt.registerFactory<SendPasswordResetEmailCubit>(
    () =>
        SendPasswordResetEmailCubit(getIt.get<SendPasswordResetEmailUseCase>()),
  );
  getIt.registerFactory<OrdersReportCubit>(
    () => OrdersReportCubit(getIt.get<GetClinetOrderUseCase>()),
  );
  getIt.registerFactory<GetRatesStatisticsCubit>(
    () => GetRatesStatisticsCubit(getIt.get<GetRatesUseCase>()),
  );
}
