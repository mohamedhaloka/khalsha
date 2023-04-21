import 'dart:async';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_webservice/places.dart' as place;
import 'package:khalsha/core/data/repository_impl/core_repository_impl.dart';
import 'package:khalsha/core/data/source/remote/core_remote_data_source.dart';
import 'package:khalsha/core/domain/use_cases/delete_file_use_case.dart';
import 'package:khalsha/core/domain/use_cases/download_file_use_case.dart';
import 'package:khalsha/core/domain/use_cases/get_particular_env_data_use_case.dart';
import 'package:khalsha/core/domain/use_cases/get_profile_use_case.dart';
import 'package:khalsha/core/domain/use_cases/update_profile_photo_use_case.dart';
import 'package:khalsha/core/domain/use_cases/update_profile_use_case.dart';
import 'package:khalsha/core/domain/use_cases/upload_image_use_case.dart';
import 'package:khalsha/features/customs_clearance_service/data/data_source/custom_clearance_remote_data_source.dart';
import 'package:khalsha/features/customs_clearance_service/data/repository_impl/customs_clearance_repository_impl.dart';
import 'package:khalsha/features/customs_clearance_service/domain/repository/customs_clearance_repository.dart';
import 'package:khalsha/features/customs_clearance_service/domain/use_cases/add_customs_clearance_use_case.dart';
import 'package:khalsha/features/customs_clearance_service/domain/use_cases/update_customs_clearance_use_case.dart';
import 'package:khalsha/features/forget_password/data/repo_impl/forget_password_repository_impl.dart';
import 'package:khalsha/features/forget_password/data/source/forget_password_remote_data_source.dart';
import 'package:khalsha/features/forget_password/domain/repository/forget_password_repository.dart';
import 'package:khalsha/features/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/data_source/laboratory_remote_data_source.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/repository_impl/laboratory_repository_impl.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/repository/laboratory_repository.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/use_case/add_laboratory_use_case.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/use_case/update_laboratory_use_case.dart';
import 'package:khalsha/features/login/domain/use_cases/login_use_case.dart';
import 'package:khalsha/features/map/data/data_source/map_remote_data_source.dart';
import 'package:khalsha/features/marine_shipping/data/data_source/marine_shipment_remote_data_source.dart';
import 'package:khalsha/features/marine_shipping/data/repository_impl/marine_shippment_repository_impl.dart';
import 'package:khalsha/features/marine_shipping/domain/repository/marine_shipment_repository.dart';
import 'package:khalsha/features/marine_shipping/domain/use_cases/add_marine_shipment_use_case.dart';
import 'package:khalsha/features/marine_shipping/domain/use_cases/update_marine_shipment_use_case.dart';
import 'package:khalsha/features/new_orders/data/data_source/new_orders_remote_data_source.dart';
import 'package:khalsha/features/new_orders/data/repo_impl/new_orders_repository_impl.dart';
import 'package:khalsha/features/new_orders/domain/repository/new_orders_repository.dart';
import 'package:khalsha/features/order_details/data/data_source/order_details_remote_data_source.dart';
import 'package:khalsha/features/order_details/data/repo_impl/order_details_repository_impl.dart';
import 'package:khalsha/features/order_details/domain/repository/order_details_repository.dart';
import 'package:khalsha/features/order_details/domain/use_cases/get_order_details_use_case.dart';
import 'package:khalsha/features/order_details/domain/use_cases/update_order_status_use_case.dart';
import 'package:khalsha/features/orders/data/data_source/orders_remote_data_source.dart';
import 'package:khalsha/features/orders/data/repo_impl/orders_repository_impl.dart';
import 'package:khalsha/features/orders/domain/repository/orders_repository.dart';
import 'package:khalsha/features/orders/domain/use_cases/get_orders_use_case.dart';
import 'package:khalsha/features/otp/data/repository_impl/otp_repository_impl.dart';
import 'package:khalsha/features/otp/data/source/otp_remote_data_source.dart';
import 'package:khalsha/features/otp/domain/repository/otp_repository.dart';
import 'package:khalsha/features/otp/domain/use_cases/check_code_use_case.dart';
import 'package:khalsha/features/otp/domain/use_cases/send_code.dart';
import 'package:khalsha/features/register/data/repository_impl/register_repository_impl.dart';
import 'package:khalsha/features/register/data/source/register_remote_data_source.dart';
import 'package:khalsha/features/register/domain/use_cases/register_use_case.dart';
import 'package:khalsha/features/reset_password/data/repo_impl/reset_password_repository_impl.dart';
import 'package:khalsha/features/reset_password/data/source/reset_password_remote_data_source.dart';
import 'package:khalsha/features/reset_password/domain/repository/reset_password_repository.dart';
import 'package:khalsha/features/reset_password/domain/use_cases/reset_password_use_case.dart';
import 'package:khalsha/features/root/data/repository_impl/root_repository_impl.dart';
import 'package:khalsha/features/root/data/source/root_remote_data_source.dart';
import 'package:khalsha/features/root/domain/repository/root_repository.dart';
import 'package:khalsha/features/root/domain/use_cases/log_out_use_case.dart';
import 'package:khalsha/features/root/domain/use_cases/refresh_token_use_case.dart';
import 'package:khalsha/features/settlement/data/data_source/settlement_remote_data_source.dart';
import 'package:khalsha/features/settlement/data/repo_impl/settlement_repository_impl.dart';
import 'package:khalsha/features/settlement/domain/repo/settlement_repository.dart';
import 'package:khalsha/features/settlement/domain/use_cases/get_settlements_use_case.dart';
import 'package:khalsha/features/stores/data/data_source/ware_house_remote_data_source.dart';
import 'package:khalsha/features/stores/data/repository_impl/ware_house_repository_impl.dart';
import 'package:khalsha/features/stores/domain/repository/ware_house_repository.dart';
import 'package:khalsha/features/stores/domain/use_case/add_ware_house_order_use_case.dart';
import 'package:khalsha/features/stores/domain/use_case/update_ware_house_order_use_case.dart';
import 'package:location/location.dart';

import 'core/data/services/http_service.dart';
import 'core/domain/repository/core_repository.dart';
import 'core/utils.dart';
import 'features/login/data/repository_impl/login_repository_impl.dart';
import 'features/login/data/source/login_remote_data_source.dart';
import 'features/login/domain/repository/login_repository.dart';
import 'features/map/data/repo_impl/map_repo_impl.dart';
import 'features/map/domain/repo/map_repo.dart';
import 'features/map/domain/use_case/get_device_location_use_case.dart';
import 'features/map/domain/use_case/get_location_name_use_case.dart';
import 'features/map/domain/use_case/get_place_details_use_case.dart';
import 'features/map/domain/use_case/get_places_from_search_use_case.dart';
import 'features/new_orders/domain/use_case/get_new_orders_use_case.dart';
import 'features/register/domain/repository/register_repository.dart';

class InjectionContainer {
  static GetIt sl = GetIt.I;

  static Future<void> init() async {
    final dioService = Get.find<HttpService>();

    //Core
    sl.registerLazySingleton<CoreRemoteDataSource>(
        () => CoreRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<CoreRepository>(() => CoreRepositoryImpl(sl()));
    sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(sl()));
    sl.registerLazySingleton<UpdateProfilePhotoUseCase>(
        () => UpdateProfilePhotoUseCase(sl()));
    sl.registerLazySingleton<UpdateProfileUseCase>(
        () => UpdateProfileUseCase(sl()));
    sl.registerLazySingleton<GetParticularEnvDataUseCase>(
        () => GetParticularEnvDataUseCase(sl()));
    sl.registerLazySingleton<UploadImageUseCase>(
        () => UploadImageUseCase(sl()));
    sl.registerLazySingleton<DeleteFileUseCase>(() => DeleteFileUseCase(sl()));
    sl.registerLazySingleton<DownloadFileUseCase>(
        () => DownloadFileUseCase(sl()));

    //Login
    sl.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

    //Register
    sl.registerLazySingleton<RegisterRemoteDataSource>(
        () => RegisterRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));

    //OTP
    sl.registerLazySingleton<OTPRemoteDataSource>(
        () => OTPRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<OTPRepository>(() => OTPRepositoryImpl(sl()));
    sl.registerLazySingleton<SendCodeUseCase>(() => SendCodeUseCase(sl()));
    sl.registerLazySingleton<CheckCodeUseCase>(() => CheckCodeUseCase(sl()));

    //Forget Password
    sl.registerLazySingleton<ForgetPasswordRemoteDataSource>(
        () => ForgetPasswordRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<ForgetPasswordRepository>(
        () => ForgetPasswordRepositoryImpl(sl()));
    sl.registerLazySingleton<ForgetPasswordUseCase>(
        () => ForgetPasswordUseCase(sl()));

    //Reset Password
    sl.registerLazySingleton<ResetPasswordRemoteDataSource>(
        () => ResetPasswordRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<ResetPasswordRepository>(
        () => ResetPasswordRepositoryImpl(sl()));
    sl.registerLazySingleton<ResetPasswordUseCase>(
        () => ResetPasswordUseCase(sl()));

    //Root
    sl.registerLazySingleton<RootRemoteDataSource>(
        () => RootRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<RootRepository>(() => RootRepositoryImpl(sl()));
    sl.registerLazySingleton<RefreshTokenUseCase>(
        () => RefreshTokenUseCase(sl()));
    sl.registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(sl()));

    //Settlements
    sl.registerLazySingleton<SettlementRemoteDataSource>(
        () => SettlementRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<SettlementRepository>(
        () => SettlementRepositoryImpl(sl()));
    sl.registerLazySingleton<GetSettlementsUseCase>(
        () => GetSettlementsUseCase(sl()));

    //Orders
    sl.registerLazySingleton<OrdersRemoteDataSource>(
        () => OrdersRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<OrdersRepository>(
        () => OrdersRepositoryImpl(sl()));
    sl.registerLazySingleton<GetOrdersUseCase>(() => GetOrdersUseCase(sl()));

    //Customs Clearance
    sl.registerLazySingleton<CustomsClearanceRemoteDataSource>(
        () => CustomsClearanceRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<CustomsClearanceRepository>(
        () => CustomsClearanceRepositoryImpl(sl()));
    sl.registerLazySingleton<AddCustomsClearanceUseCase>(
        () => AddCustomsClearanceUseCase(sl()));
    sl.registerLazySingleton<UpdateCustomsClearanceUseCase>(
        () => UpdateCustomsClearanceUseCase(sl()));

    //Ware Houses
    sl.registerLazySingleton<WareHouseRemoteDataSource>(
        () => WareHouseRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<WareHouseRepository>(
        () => WareHouseRepositoryImpl(sl()));
    sl.registerLazySingleton<AddWareHouseOrderUseCase>(
        () => AddWareHouseOrderUseCase(sl()));
    sl.registerLazySingleton<UpdateWareHouseOrderUseCase>(
        () => UpdateWareHouseOrderUseCase(sl()));

    //Laboratory Houses
    sl.registerLazySingleton<LaboratoryRemoteDataSource>(
        () => LaboratoryRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<LaboratoryRepository>(
        () => LaboratoryRepositoryImpl(sl()));
    sl.registerLazySingleton<AddLaboratoryUseCase>(
        () => AddLaboratoryUseCase(sl()));
    sl.registerLazySingleton<UpdateLaboratoryUseCase>(
        () => UpdateLaboratoryUseCase(sl()));

    //Marine Shipment
    sl.registerLazySingleton<MarineShipmentRemoteDataSource>(
        () => MarineShipmentRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<MarineShipmentRepository>(
        () => MarineShipmentRepositoryImpl(sl()));
    sl.registerLazySingleton<AddMarineShipmentUseCase>(
        () => AddMarineShipmentUseCase(sl()));
    sl.registerLazySingleton<UpdateMarineShipmentUseCase>(
        () => UpdateMarineShipmentUseCase(sl()));

    //New Orders
    sl.registerLazySingleton<NewOrdersRemoteDataSource>(
        () => NewOrdersRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<NewOrdersRepository>(
        () => NewOrdersRepositoryImpl(sl()));
    sl.registerLazySingleton<GetNewOrdersUseCase>(
        () => GetNewOrdersUseCase(sl()));

    //Order Details
    sl.registerLazySingleton<OrderDetailsRemoteDataSource>(
        () => OrderDetailsRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<OrderDetailsRepository>(
        () => OrderDetailsRepositoryImpl(sl()));
    sl.registerLazySingleton<GetOrderDetailsUseCase>(
        () => GetOrderDetailsUseCase(sl()));
    sl.registerLazySingleton<UpdateOrderStatusUseCase>(
        () => UpdateOrderStatusUseCase(sl()));

    //Map
    sl.registerLazySingleton<Location>(() => Location());
    sl.registerLazySingleton<place.GoogleMapsPlaces>(
        () => place.GoogleMapsPlaces(apiKey: apiKey));
    sl.registerLazySingleton<MapRemoteDataSource>(
        () => MapRemoteDataSourceImpl(sl(), sl()));
    sl.registerLazySingleton<MapRepository>(() => MapRepositoryImpl(sl()));
    sl.registerLazySingleton<GetDeviceLocationUseCase>(
        () => GetDeviceLocationUseCase(sl()));
    sl.registerLazySingleton<GetLocationNameUseCase>(
        () => GetLocationNameUseCase(sl()));
    sl.registerLazySingleton<GetPlacesFromSearchUseCase>(
        () => GetPlacesFromSearchUseCase(sl()));
    sl.registerLazySingleton<GetPlaceDetailsUseCase>(
        () => GetPlaceDetailsUseCase(sl()));
  }
}
