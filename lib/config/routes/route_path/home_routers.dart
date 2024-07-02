import 'package:get/get.dart';
import 'package:template/presentation/pages/home/home_binding.dart';
import 'package:template/presentation/pages/home/home_page.dart';
import 'package:template/presentation/pages/notification/notification_binding.dart';
import 'package:template/presentation/pages/notification/notification_page.dart';

mixin HomeRoute {
  static const String HOME = '/home';
  static const String NOTIFICATION = '/notification';

  static List<GetPage> listPage = [
    GetPage(
      name: HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: NOTIFICATION,
      page: () => NotificationPage(),
      binding: NotificationBinding(),
    ),
  ];
}
