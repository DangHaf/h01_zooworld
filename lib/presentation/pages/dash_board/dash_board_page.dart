import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/presentation/pages/appointment/appointment_page.dart';
import 'package:template/presentation/pages/dash_board/dash_board_controller.dart';
import 'package:template/presentation/pages/dash_board/default_page.dart';
import 'package:template/presentation/pages/dash_board/widgets/item_navigation.dart';
import 'package:template/presentation/pages/home/home_page.dart';

class DashBoardPage extends GetView<DashBoardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        return IndexedStack(index: controller.currentIndex.value, children: [
          HomePage(),
          AppointmentPage(),
          DefaultPage(),
          DefaultPage(),
          DefaultPage()
        ]);
      }),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: _buildBottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ItemNavigation(
          icon: ImagesPath.icHome,
          title: 'Home'.tr,
          isSelected: controller.currentIndex.value == 0,
          callBack: () => controller.onChangeDashboardPage(index: 0),
        ),
        ItemNavigation(
          icon: ImagesPath.icAppointment,
          title: 'Appointment'.tr,
          isSelected: controller.currentIndex.value == 1,
          callBack: () => controller.onChangeDashboardPage(index: 1),
        ),
        ItemNavigation(
          icon: ImagesPath.icSchedule,
          title: 'Schedule'.tr,
          isSelected: controller.currentIndex.value == 2,
          callBack: () => controller.onChangeDashboardPage(index: 2),
        ),
        ItemNavigation(
          icon: ImagesPath.icIncome,
          title: 'Income'.tr,
          isSelected: controller.currentIndex.value == 3,
          callBack: () => controller.onChangeDashboardPage(index: 3),
        ),
        ItemNavigation(
          icon: ImagesPath.icSetting,
          title: 'Setting'.tr,
          isSelected: controller.currentIndex.value == 4,
          callBack: () => controller.onChangeDashboardPage(index: 4),
        ),
      ],
    );
  }
}
