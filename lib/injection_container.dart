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
import 'package:khalsha/features/account_settings/data/data_source/account_settings_remote_data_source.dart';
import 'package:khalsha/features/account_settings/data/repo_impl/account_settings_repository_impl.dart';
import 'package:khalsha/features/account_settings/domain/use_cases/change_password_use_case.dart';
import 'package:khalsha/features/account_settings/domain/use_cases/update_account_use_case.dart';
import 'package:khalsha/features/account_settings/domain/use_cases/upload_profile_photo_use_case.dart';
import 'package:khalsha/features/air_freight_service/data/data_source/air_freight_remote_data_source.dart';
import 'package:khalsha/features/air_freight_service/data/repository_impl/air_freight_repository_impl.dart';
import 'package:khalsha/features/air_freight_service/domain/repository/air_freight_repository.dart';
import 'package:khalsha/features/air_freight_service/domain/use_cases/add_air_freight_use_case.dart';
import 'package:khalsha/features/air_freight_service/domain/use_cases/update_air_freight_use_case.dart';
import 'package:khalsha/features/blog/data/data_source/blog_remote_data_source.dart';
import 'package:khalsha/features/blog/data/repo_impl/blog_repository_impl.dart';
import 'package:khalsha/features/blog/domain/repo/blog_repository.dart';
import 'package:khalsha/features/blog/domain/use_cases/blog_search_use_case.dart';
import 'package:khalsha/features/blog/domain/use_cases/get_categories_use_case.dart';
import 'package:khalsha/features/blog/domain/use_cases/get_post_by_cat_id_use_case.dart';
import 'package:khalsha/features/contact_us/data/data_source/contact_us_remote_data_source.dart';
import 'package:khalsha/features/contact_us/data/repo_impl/contact_us_repository_impl.dart';
import 'package:khalsha/features/contact_us/domain/repository/contact_us_repository.dart';
import 'package:khalsha/features/contact_us/domain/use_cases/send_message_use_case.dart';
import 'package:khalsha/features/customs_clearance_service/data/data_source/custom_clearance_remote_data_source.dart';
import 'package:khalsha/features/customs_clearance_service/data/repository_impl/customs_clearance_repository_impl.dart';
import 'package:khalsha/features/customs_clearance_service/domain/repository/customs_clearance_repository.dart';
import 'package:khalsha/features/customs_clearance_service/domain/use_cases/add_customs_clearance_use_case.dart';
import 'package:khalsha/features/customs_clearance_service/domain/use_cases/update_customs_clearance_use_case.dart';
import 'package:khalsha/features/forget_password/data/repo_impl/forget_password_repository_impl.dart';
import 'package:khalsha/features/forget_password/data/source/forget_password_remote_data_source.dart';
import 'package:khalsha/features/forget_password/domain/repository/forget_password_repository.dart';
import 'package:khalsha/features/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:khalsha/features/home/data/data_source/home_remote_data_source.dart';
import 'package:khalsha/features/home/data/repo_impl/home_repository_impl.dart';
import 'package:khalsha/features/home/domain/repository/home_repository.dart';
import 'package:khalsha/features/home/domain/use_cases/get_statistics_use_case.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/data_source/laboratory_remote_data_source.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/repository_impl/laboratory_repository_impl.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/repository/laboratory_repository.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/use_case/add_laboratory_use_case.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/use_case/update_laboratory_use_case.dart';
import 'package:khalsha/features/land_shipping/data/data_source/land_shipping_remote_data_source.dart';
import 'package:khalsha/features/land_shipping/data/repository_impl/land_shipping_repository_impl.dart';
import 'package:khalsha/features/land_shipping/domain/use_cases/add_land_shipping_use_case.dart';
import 'package:khalsha/features/land_shipping/domain/use_cases/update_land_shipping_use_case.dart';
import 'package:khalsha/features/login/domain/use_cases/login_use_case.dart';
import 'package:khalsha/features/login/domain/use_cases/social_login_use_case.dart';
import 'package:khalsha/features/map/data/data_source/map_remote_data_source.dart';
import 'package:khalsha/features/marine_shipping/data/data_source/marine_shipment_remote_data_source.dart';
import 'package:khalsha/features/marine_shipping/data/repository_impl/marine_shippment_repository_impl.dart';
import 'package:khalsha/features/marine_shipping/domain/repository/marine_shipment_repository.dart';
import 'package:khalsha/features/marine_shipping/domain/use_cases/add_marine_shipment_use_case.dart';
import 'package:khalsha/features/marine_shipping/domain/use_cases/update_marine_shipment_use_case.dart';
import 'package:khalsha/features/my_bills/data/data_source/my_bills_remote_data_source.dart';
import 'package:khalsha/features/my_bills/data/repo_impl/my_bills_repository_impl.dart';
import 'package:khalsha/features/my_bills/domain/repository/my_bills_repository.dart';
import 'package:khalsha/features/my_bills/domain/use_cases/get_my_bills_use_case.dart';
import 'package:khalsha/features/notifications/data/data_source/notifications_remote_data_source.dart';
import 'package:khalsha/features/notifications/data/repo_impl/notifications_repository_impl.dart';
import 'package:khalsha/features/notifications/domain/repository/notifications_repository.dart';
import 'package:khalsha/features/notifications/domain/use_cases/get_notifications_use_case.dart';
import 'package:khalsha/features/order_details/data/data_source/order_details_remote_data_source.dart';
import 'package:khalsha/features/order_details/data/repo_impl/order_details_repository_impl.dart';
import 'package:khalsha/features/order_details/domain/repository/order_details_repository.dart';
import 'package:khalsha/features/order_details/domain/use_cases/accept_reject_offer_use_case.dart';
import 'package:khalsha/features/order_details/domain/use_cases/get_order_details_use_case.dart';
import 'package:khalsha/features/order_details/domain/use_cases/rate_order_use_case.dart';
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
import 'package:khalsha/features/root/domain/use_cases/update_fcm_token_use_case.dart';
import 'package:khalsha/features/rule/data/data_source/rule_remote_data_source.dart';
import 'package:khalsha/features/rule/data/repo_impl/rule_repository_impl.dart';
import 'package:khalsha/features/rule/domain/use_cases/get_rule_data_use_case.dart';
import 'package:khalsha/features/sources/data/data_source/resources_remote_data_source.dart';
import 'package:khalsha/features/sources/data/repo_impl/resources_repository_impl.dart';
import 'package:khalsha/features/sources/domain/repo/resources_repository.dart';
import 'package:khalsha/features/sources/domain/use_cases/get_resource_details_use_case.dart';
import 'package:khalsha/features/sources/domain/use_cases/get_resources_use_case.dart';
import 'package:khalsha/features/stores/data/data_source/ware_house_remote_data_source.dart';
import 'package:khalsha/features/stores/data/repository_impl/ware_house_repository_impl.dart';
import 'package:khalsha/features/stores/domain/repository/ware_house_repository.dart';
import 'package:khalsha/features/stores/domain/use_case/add_ware_house_order_use_case.dart';
import 'package:khalsha/features/stores/domain/use_case/update_ware_house_order_use_case.dart';
import 'package:location/location.dart';

import 'core/data/services/http_service.dart';
import 'core/domain/repository/core_repository.dart';
import 'core/utils.dart';
import 'features/account_settings/domain/repository/account_settings_repository.dart';
import 'features/land_shipping/domain/repository/land_shipping_repository.dart';
import 'features/login/data/repository_impl/login_repository_impl.dart';
import 'features/login/data/source/login_remote_data_source.dart';
import 'features/login/domain/repository/login_repository.dart';
import 'features/map/data/repo_impl/map_repo_impl.dart';
import 'features/map/domain/repo/map_repo.dart';
import 'features/map/domain/use_case/get_device_location_use_case.dart';
import 'features/map/domain/use_case/get_location_name_use_case.dart';
import 'features/map/domain/use_case/get_place_details_use_case.dart';
import 'features/map/domain/use_case/get_places_from_search_use_case.dart';
import 'features/register/domain/repository/register_repository.dart';
import 'features/rule/domain/repo/rule_repository.dart';

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
    sl.registerLazySingleton<SocialLoginUseCase>(
        () => SocialLoginUseCase(sl()));

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
    sl.registerLazySingleton<UpdateFCMTokenUseCase>(
        () => UpdateFCMTokenUseCase(sl()));

    //Home
    sl.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
    sl.registerLazySingleton<GetStatisticsUseCase>(
        () => GetStatisticsUseCase(sl()));

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

    //Air Freight
    sl.registerLazySingleton<AirFreightRemoteDataSource>(
        () => AirFreightRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<AirFreightRepository>(
        () => AirFreightRepositoryImpl(sl()));
    sl.registerLazySingleton<AddAirFreightUseCase>(
        () => AddAirFreightUseCase(sl()));
    sl.registerLazySingleton<UpdateAirFreightUseCase>(
        () => UpdateAirFreightUseCase(sl()));

    //Land Shipping
    sl.registerLazySingleton<LandShippingRemoteDataSource>(
        () => LandShippingRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<LandShippingRepository>(
        () => LandShippingRepositoryImpl(sl()));
    sl.registerLazySingleton<AddLandShippingUseCase>(
        () => AddLandShippingUseCase(sl()));
    sl.registerLazySingleton<UpdateLandShippingUseCase>(
        () => UpdateLandShippingUseCase(sl()));

    //Order Details
    sl.registerLazySingleton<OrderDetailsRemoteDataSource>(
        () => OrderDetailsRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<OrderDetailsRepository>(
        () => OrderDetailsRepositoryImpl(sl()));
    sl.registerLazySingleton<UpdateOrderStatusUseCase>(
        () => UpdateOrderStatusUseCase(sl()));
    sl.registerLazySingleton<AcceptRejectOfferUseCase>(
        () => AcceptRejectOfferUseCase(sl()));
    sl.registerLazySingleton<GetOrderDetailsUseCase>(
        () => GetOrderDetailsUseCase(sl()));
    sl.registerLazySingleton<RateOrderUseCase>(() => RateOrderUseCase(sl()));

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

    //My Bills
    sl.registerLazySingleton<MyBillsRemoteDataSource>(
        () => MyBillsRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<MyBillsRepository>(
        () => MyBillsRepositoryImpl(sl()));
    sl.registerLazySingleton<GetMyBillsUseCase>(() => GetMyBillsUseCase(sl()));

    //Notifications
    sl.registerLazySingleton<NotificationsRemoteDataSource>(
        () => NotificationsRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<NotificationsRepository>(
        () => NotificationsRepositoryImpl(sl()));
    sl.registerLazySingleton<GetNotificationsUseCase>(
        () => GetNotificationsUseCase(sl()));

    //Account Settings
    sl.registerLazySingleton<AccountSettingsRemoteDataSource>(
        () => AccountSettingsRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<AccountSettingsRepository>(
        () => AccountSettingsRepositoryImpl(sl()));
    sl.registerLazySingleton<ChangePasswordUseCase>(
        () => ChangePasswordUseCase(sl()));
    sl.registerLazySingleton<UpdateAccountUseCase>(
        () => UpdateAccountUseCase(sl()));
    sl.registerLazySingleton<UploadProfilePhotoUseCase>(
        () => UploadProfilePhotoUseCase(sl()));

    //Blog
    sl.registerLazySingleton<BlogRemoteDataSource>(
        () => BlogRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<BlogRepository>(() => BlogRepositoryImpl(sl()));
    sl.registerLazySingleton<BlogSearchUseCase>(() => BlogSearchUseCase(sl()));
    sl.registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton<GetPostsByCatIdUseCase>(
        () => GetPostsByCatIdUseCase(sl()));

    //Resource
    sl.registerLazySingleton<ResourcesRemoteDataSource>(
        () => ResourcesRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<ResourcesRepository>(
        () => ResourcesRepositoryImpl(sl()));
    sl.registerLazySingleton<GetResourcesUseCase>(
        () => GetResourcesUseCase(sl()));
    sl.registerLazySingleton<GetResourceDetailsUseCase>(
        () => GetResourceDetailsUseCase(sl()));

    //Rule
    sl.registerLazySingleton<RuleRemoteDataSource>(
        () => RuleRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<RuleRepository>(() => RuleRepositoryImpl(sl()));
    sl.registerLazySingleton<GetRuleDataUseCase>(
        () => GetRuleDataUseCase(sl()));

    //Contact US
    sl.registerLazySingleton<ContactUsRemoteDataSource>(
        () => ContactUsRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<ContactUsRepository>(
        () => ContactUsRepositoryImpl(sl()));
    sl.registerLazySingleton<SendMessageContactUsUseCase>(
        () => SendMessageContactUsUseCase(sl()));
  }
}
