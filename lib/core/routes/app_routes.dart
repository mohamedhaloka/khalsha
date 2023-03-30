import 'package:get/get.dart';
import 'package:khalsha/features/account_settings/presentation/view.dart';
import 'package:khalsha/features/bill_details/presentation/get/binding/binding.dart';
import 'package:khalsha/features/bill_details/presentation/view.dart';
import 'package:khalsha/features/blog/presentation/get/binding/binding.dart';
import 'package:khalsha/features/blog/presentation/view.dart';
import 'package:khalsha/features/common_questions/presentation/get/binding/binding.dart';
import 'package:khalsha/features/common_questions/presentation/view.dart';
import 'package:khalsha/features/contact_us/presentation/get/binding/binding.dart';
import 'package:khalsha/features/contact_us/presentation/view.dart';
import 'package:khalsha/features/fill_service_details/presentation/views/air_freight_service/get/bindings/binding.dart';
import 'package:khalsha/features/fill_service_details/presentation/views/air_freight_service/view.dart';
import 'package:khalsha/features/fill_service_details/presentation/views/laboratory_and_standards_service/get/bindings/binding.dart';
import 'package:khalsha/features/fill_service_details/presentation/views/laboratory_and_standards_service/view.dart';
import 'package:khalsha/features/fill_service_details/presentation/views/land_shipping/get/bindings/binding.dart';
import 'package:khalsha/features/fill_service_details/presentation/views/land_shipping/view.dart';
import 'package:khalsha/features/fill_service_details/presentation/views/marine_shipping/view.dart';
import 'package:khalsha/features/how_to_use/presentation/view.dart';
import 'package:khalsha/features/intro/presentation/get/binding/binding.dart';
import 'package:khalsha/features/intro/presentation/view.dart';
import 'package:khalsha/features/login/presentation/get/bindings/binding.dart';
import 'package:khalsha/features/login/presentation/view.dart';
import 'package:khalsha/features/navigation_menu/presentation/get/binding/binding.dart';
import 'package:khalsha/features/navigation_menu/presentation/view.dart';
import 'package:khalsha/features/new_orders/presentation/view.dart';
import 'package:khalsha/features/on_boarding/presentation/get/bindings/binding.dart';
import 'package:khalsha/features/on_boarding/presentation/view.dart';
import 'package:khalsha/features/order_details/presentation/view.dart';
import 'package:khalsha/features/orders/presentation/view.dart';
import 'package:khalsha/features/otp/presentation/get/binding/binding.dart';
import 'package:khalsha/features/otp/presentation/view.dart';
import 'package:khalsha/features/post_details/presentation/get/binding/binding.dart';
import 'package:khalsha/features/post_details/presentation/view.dart';
import 'package:khalsha/features/register/presentation/get/bindings/binding.dart';
import 'package:khalsha/features/register/presentation/view.dart';
import 'package:khalsha/features/service_intro/presentation/get/binding/binding.dart';
import 'package:khalsha/features/service_intro/presentation/view.dart';
import 'package:khalsha/features/settlement_details/presentation/get/binding/binding.dart';
import 'package:khalsha/features/settlement_details/presentation/view.dart';
import 'package:khalsha/features/share_app/presentation/get/binding/binding.dart';
import 'package:khalsha/features/share_app/presentation/view.dart';
import 'package:khalsha/features/sources/presentation/get/binding/binding.dart';
import 'package:khalsha/features/statistics/presentation/get/binding/binding.dart';
import 'package:khalsha/features/statistics/presentation/view.dart';

import '../../features/account_settings/presentation/get/binding/binding.dart';
import '../../features/fill_service_details/presentation/views/customs_clearance_service/get/bindings/binding.dart';
import '../../features/fill_service_details/presentation/views/customs_clearance_service/view.dart';
import '../../features/fill_service_details/presentation/views/marine_shipping/get/bindings/binding.dart';
import '../../features/fill_service_details/presentation/views/stores/get/bindings/binding.dart';
import '../../features/fill_service_details/presentation/views/stores/view.dart';
import '../../features/how_to_use/presentation/get/binding/binding.dart';
import '../../features/new_orders/presentation/get/binding/binding.dart';
import '../../features/order_details/presentation/get/binding/binding.dart';
import '../../features/orders/presentation/get/binding/binding.dart';
import '../../features/sources/presentation/view.dart';

part 'app_pages.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.onBoarding;

  static final routes = [
    GetPage(
      name: _Paths.onBoarding,
      page: () => const OnBoardingView(),
      binding: OnBoardingBindings(),
    ),
    GetPage(
      name: _Paths.intro,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.otp,
      page: () => const OTPView(),
      binding: OTPBinding(),
    ),
    GetPage(
      name: _Paths.navigationMenu,
      page: () => const NavigationMenuView(),
      binding: NavigationMenuBinding(),
    ),
    GetPage(
      name: _Paths.serviceIntro,
      page: () => const ServiceIntroView(),
      binding: ServiceIntroBinding(),
    ),
    GetPage(
      name: _Paths.commonQuestions,
      page: () => const CommonQuestionsView(),
      binding: CommonQuestionsBinding(),
    ),
    GetPage(
      name: _Paths.shareApp,
      page: () => const ShareAppView(),
      binding: ShareAppBinding(),
    ),
    GetPage(
      name: _Paths.sources,
      page: () => const SourcesView(),
      binding: SourcesBinding(),
    ),
    GetPage(
      name: _Paths.contactUS,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.blog,
      page: () => const BlogView(),
      binding: BlogBinding(),
    ),
    GetPage(
      name: _Paths.postDetails,
      page: () => const PostDetailsView(),
      binding: PostDetailsBinding(),
    ),
    GetPage(
      name: _Paths.orderDetails,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.settlementDetails,
      page: () => const SettlementDetailsView(),
      binding: SettlementDetailsBinding(),
    ),
    GetPage(
      name: _Paths.billDetails,
      page: () => const BillDetailsView(),
      binding: BillDetailsBinding(),
    ),
    GetPage(
      name: _Paths.accountSettings,
      page: () => const AccountSettingsView(),
      binding: AccountSettingsBinding(),
    ),
    GetPage(
      name: _Paths.howToUse,
      page: () => const HowToUseView(),
      binding: HowToUseBinding(),
    ),
    GetPage(
      name: _Paths.orders,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.newOrders,
      page: () => const NewOrdersView(),
      binding: NewOrdersBinding(),
    ),
    GetPage(
      name: _Paths.statistics,
      page: () => const StatisticsView(),
      binding: StatisticsBinding(),
    ),
    GetPage(
      name: _Paths.customsClearanceService,
      page: () => const AddEditCustomsClearanceServiceView(),
      binding: AddEditCustomsClearanceServiceBinding(),
    ),
    GetPage(
      name: _Paths.laboratoryAndStandardsService,
      page: () => const AddEditLaboratoryAndStandardsServiceView(),
      binding: AddEditLaboratoryAndStandardsServiceBinding(),
    ),
    GetPage(
      name: _Paths.airFreight,
      page: () => const AddEditAirFreightServiceView(),
      binding: AddEditAirFreightServiceBinding(),
    ),
    GetPage(
      name: _Paths.marineShipping,
      page: () => const AddEditMarineShippingServiceView(),
      binding: AddEditMarineShippingServiceBinding(),
    ),
    GetPage(
      name: _Paths.landShipping,
      page: () => const AddEditLandShippingServiceView(),
      binding: AddEditLandShippingBinding(),
    ),
    GetPage(
      name: _Paths.stores,
      page: () => const AddEditStoresServiceView(),
      binding: AddEditStoresServiceBinding(),
    ),
  ];
}
