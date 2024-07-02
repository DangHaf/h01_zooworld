import 'package:get/get.dart';
import 'package:template/presentation/pages/account/account_controller.dart';
import 'package:template/presentation/pages/dash_board/dash_board_controller.dart';
import 'package:template/presentation/pages/home/home_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashBoardController>(DashBoardController());
    Get.put<AccountController>(AccountController());
    Get.put<HomeController>(HomeController());
  }
}
