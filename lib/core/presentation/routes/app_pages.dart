part of 'app_routes.dart';

abstract class Routes {
  Routes._();
  static const onBoarding = _Paths.onBoarding;
  static const intro = _Paths.intro;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const otp = _Paths.otp;
  static const navigationMenu = _Paths.navigationMenu;
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
  static const settlementDetails = _Paths.settlementDetails;
  static const billDetails = _Paths.billDetails;
  static const accountSettings = _Paths.accountSettings;
  static const howToUse = _Paths.howToUse;
  static const orders = _Paths.orders;
  static const newOrders = _Paths.newOrders;
  static const statistics = _Paths.statistics;
}

abstract class _Paths {
  static const onBoarding = '/on_boarding';
  static const intro = '/intro';
  static const login = '/login';
  static const register = '/register';
  static const otp = '/otp';
  static const navigationMenu = '/navigation_menu';
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
  static const settlementDetails = '/settlement_details';
  static const billDetails = '/bill_details';
  static const accountSettings = '/account_settings';
  static const howToUse = '/how_to_use';
  static const orders = '/orders';
  static const newOrders = '/new_orders';
  static const statistics = '/statistics';
}
