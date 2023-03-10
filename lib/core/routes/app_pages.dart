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
}
