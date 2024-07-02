import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:template/config/routes/route_path/app_routers.dart';
import 'package:template/config/routes/route_path/home_routers.dart';

mixin AppPages {
  static List<GetPage> list = [
    ...AppRoute.listPage,
    ...HomeRoute.listPage,
  ];
}
