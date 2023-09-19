import 'package:get/get.dart';
import 'package:khalsha/features/account_settings/presentation/view.dart';
import 'package:khalsha/features/add_phone_number/presentation/view.dart';
import 'package:khalsha/features/blog/presentation/get/binding/binding.dart';
import 'package:khalsha/features/blog/presentation/view.dart';
import 'package:khalsha/features/choose_shipping_service/presentation/view.dart';
import 'package:khalsha/features/common_questions/presentation/get/binding/binding.dart';
import 'package:khalsha/features/common_questions/presentation/view.dart';
import 'package:khalsha/features/contact_us/presentation/get/binding/binding.dart';
import 'package:khalsha/features/contact_us/presentation/view.dart';
import 'package:khalsha/features/forget_password/presentation/view.dart';
import 'package:khalsha/features/intro/presentation/get/binding/binding.dart';
import 'package:khalsha/features/intro/presentation/view.dart';
import 'package:khalsha/features/land_shipping/land_shipping.dart';
import 'package:khalsha/features/login/presentation/get/bindings/binding.dart';
import 'package:khalsha/features/login/presentation/view.dart';
import 'package:khalsha/features/map/presentation/getx/bindings/binding.dart';
import 'package:khalsha/features/map/presentation/view.dart';
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
import 'package:khalsha/features/root/presentation/get/binding/binding.dart';
import 'package:khalsha/features/root/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/root/presentation/view.dart';
import 'package:khalsha/features/rule/presentation/view.dart';
import 'package:khalsha/features/service_intro/presentation/get/binding/binding.dart';
import 'package:khalsha/features/service_intro/presentation/view.dart';
import 'package:khalsha/features/sources/presentation/get/binding/binding.dart';
import 'package:khalsha/features/statistics/presentation/get/binding/binding.dart';
import 'package:khalsha/features/statistics/presentation/view.dart';

import '../../../features/account_settings/presentation/get/binding/binding.dart';
import '../../../features/add_phone_number/presentation/get/bindings/binding.dart';
import '../../../features/air_freight_service/air_freight_service.dart';
import '../../../features/choose_shipping_service/presentation/get/bindings/binding.dart';
import '../../../features/customs_clearance_service/customs_clearance.dart';
import '../../../features/customs_clearance_service/view/get/bindings/binding.dart';
import '../../../features/forget_password/presentation/get/binding/binding.dart';
import '../../../features/laboratory_and_standards_service/laboratory.dart';
import '../../../features/marine_shipping/marine_shipping.dart';
import '../../../features/order_details/presentation/get/binding/binding.dart';
import '../../../features/orders/presentation/get/binding/binding.dart';
import '../../../features/reset_password/presentation/get/binding/binding.dart';
import '../../../features/reset_password/presentation/view.dart';
import '../../../features/rule/presentation/get/bindings/binding.dart';
import '../../../features/sources/presentation/view.dart';
import '../../../features/stores/presentation/get/bindings/binding.dart';
import '../../../features/stores/stores.dart';

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
      name: _Paths.root,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.serviceIntro,
      page: () => const ServiceIntroView(),
      binding: ServiceIntroBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.commonQuestions,
      page: () => const CommonQuestionsView(),
      binding: CommonQuestionsBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.sources,
      page: () => const SourcesView(),
      binding: SourcesBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.contactUS,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.blog,
      page: () => const BlogView(),
      binding: BlogBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.postDetails,
      page: () => const PostDetailsView(),
      binding: PostDetailsBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.orderDetails,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.accountSettings,
      page: () => const AccountSettingsView(),
      binding: AccountSettingsBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.orders,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.statistics,
      page: () => const StatisticsView(),
      binding: StatisticsBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.customsClearanceService,
      page: () => const AddEditCustomsClearanceServiceView(),
      binding: AddEditCustomsClearanceServiceBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.laboratoryAndStandardsService,
      page: () => const AddEditLaboratoryAndStandardsServiceView(),
      binding: AddEditLaboratoryAndStandardsServiceBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.airFreight,
      page: () => const AddEditAirFreightServiceView(),
      binding: AddEditAirFreightServiceBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.marineShipping,
      page: () => const AddEditMarineShippingServiceView(),
      binding: AddEditMarineShippingServiceBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.landShipping,
      page: () => const AdEditLandShippingServiceView(),
      binding: AddEditLandShippingServiceBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.stores,
      page: () => const AddEditStoresServiceView(),
      binding: AddEditStoresServiceBinding(),
      middlewares: [VerifyAccountMiddleware()],
    ),
    GetPage(
      name: _Paths.forgetPassword,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.resetPassword,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.map,
      page: () => const MapView(),
      binding: MapBinding(),
    ),
    GetPage(
      name: _Paths.chooseShippingService,
      page: () => const ChooseShippingServiceView(),
      binding: ChooseShippingServiceBinding(),
    ),
    GetPage(
      name: _Paths.rule,
      page: () => const RuleView(),
      binding: RuleBinding(),
    ),
    GetPage(
      name: _Paths.addPhoneNumber,
      page: () => const AddPhoneNumberView(),
      binding: AddPhoneNumberBinding(),
    ),
  ];
}

class VerifyAccountMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    final rootController = Get.find<RootController>();
    if (rootController.errorType.isNotEmpty) {
      return null;
    }
    return page;
  }
}
