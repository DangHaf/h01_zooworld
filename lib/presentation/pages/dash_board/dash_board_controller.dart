import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';

class DashBoardController extends GetxController with WidgetsBindingObserver {
  RxInt currentIndex = 1.obs;

  RxBool isLogged = sl<SharedPreferenceHelper>().isLogged.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  void onChangeDashboardPage({
    required int index,
    bool needRefresh = true,
    String? idCart,
    List<String> idBuyBack = const [],
  }) {
    if (index == currentIndex.value) return;
    currentIndex.value = index;
  }
}
