import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/screens/app.dart';
import 'package:uptodo/screens/auth/authoptions/auth_option_view.dart';
import 'package:uptodo/screens/auth/localauth/pin_view.dart';
import 'package:uptodo/screens/auth/login/login_view.dart';
import 'package:uptodo/screens/auth/register/register_view.dart';
import 'package:uptodo/screens/intro/intro_view.dart';
import 'package:uptodo/screens/splash/splashview.dart';

class AppPages{


  static const initial=Routes.splashView;
  static final routes=[
    GetPage(name: Routes.splashView, page: ()=>const Splashview()),
    GetPage(name: Routes.home, page: ()=>const App()),
    GetPage(name: Routes.intro, page: ()=>IntroView()),
    GetPage(name: Routes.authOption, page: ()=>AuthOptionView()),
    GetPage(name: Routes.loginView, page: ()=>LoginView()),
    GetPage(name: Routes.registerView, page: ()=>RegisterView()),
    GetPage(name: Routes.localAuth, page: ()=>PinView()),



  ];
}