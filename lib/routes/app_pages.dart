import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/screens/app.dart';

class AppPages{


  static const initial=Routes.splashView;
  static final routes=[
    GetPage(name: Routes.home, page: ()=>const App())
  ];
}