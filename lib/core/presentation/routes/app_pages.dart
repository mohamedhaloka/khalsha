part of 'app_routes.dart';

abstract class Routes {
  Routes._();
  static const onBoarding = _Paths.onBoarding;
  static const intro = _Paths.intro;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const otp = _Paths.otp;
  static const root = _Paths.root;
  static const serviceIntro = _Paths.serviceIntro;
  static const commonQuestions = _Paths.commonQuestions;
  static const shareApp = _Paths.shareApp;
  static const sources = _Paths.sources;
  static const contactUS = _Paths.contactUS;
  static const blog = _Paths.blog;
  static const postDetails = _Paths.postDetails;
  static const customsClearanceService = _Paths.customsClearanceService;
  static const laboratoryAndStandardsService =
      _Paths.laboratoryAndStandardsService;
  static const airFreight = _Paths.airFreight;
  static const landShipping = _Paths.landShipping;
  static const marineShipping = _Paths.marineShipping;
  static const stores = _Paths.stores;
  static const orderDetails = _Paths.orderDetails;
  static const accountSettings = _Paths.accountSettings;
  static const orders = _Paths.orders;
  static const statistics = _Paths.statistics;
  static const forgetPassword = _Paths.forgetPassword;
  static const resetPassword = _Paths.resetPassword;
  static const map = _Paths.map;
  static const chooseShippingService = _Paths.chooseShippingService;
  static const rule = _Paths.rule;
  static const addPhoneNumber = _Paths.addPhoneNumber;
}

abstract class _Paths {
  static const onBoarding = '/on_boarding';
  static const intro = '/intro';
  static const login = '/login';
  static const register = '/register';
  static const otp = '/otp';
  static const root = '/root';
  static const serviceIntro = '/service_intro';
  static const commonQuestions = '/common_questions';
  static const shareApp = '/share_app';
  static const sources = '/sources';
  static const contactUS = '/contact_us';
  static const blog = '/blog';
  static const postDetails = '/post_details';
  static const customsClearanceService = '/customs_clearance_service';
  static const laboratoryAndStandardsService =
      '/laboratory_and_standards_service';
  static const airFreight = '/air_freight';
  static const landShipping = '/land_shipping';
  static const marineShipping = '/marine_shipping';
  static const stores = '/stores';
  static const orderDetails = '/order_details';
  static const accountSettings = '/account_settings';
  static const orders = '/orders';
  static const statistics = '/statistics';
  static const forgetPassword = '/forget_password';
  static const resetPassword = '/reset_password';
  static const map = '/map';
  static const chooseShippingService = '/choose_shipping_service';
  static const rule = '/rule';
  static const addPhoneNumber = '/add_phone_number';
}
