import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/presentation/pages/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder(
        init: SplashController(),
        builder: (SplashController controller) {
          return Center(
            child: Text(
              'STAFF',
              style: AppText.text50.copyWith(
                color: ColorResources.COLOR_1255B9,
              ),
            ),
          );
        },
      ),
    );
  }
}
