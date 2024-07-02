import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/presentation/pages/auth/reset_password/reset_password_controller.dart';
import 'package:template/presentation/pages/auth/widgets/appbar_auth.dart';
import 'package:template/presentation/pages/auth/widgets/auth_input.dart';
import 'package:template/presentation/widgets/custom_button.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IgnorePointer(
        ignoring: controller.ignoring.value,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarAuth(title: 'Create new password'.tr),
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Image.asset(ImagesPath.imageReset, width: 324.w),
          SizedBox(height: 20.h),
          Text(
            'Enter a new password to proceed with changing your password'
                .tr,
            style: AppText.text14.copyWith(
              color: ColorResources.COLOR_1255B9,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 70.h),
          AuthInput(
            isPassword: true,
            controller: controller.newPassword,
            hintText: 'Enter new password'.tr,
            fillColor: ColorResources.COLOR_EAEAEA.withOpacity(0.53),
            focusNode: controller.focusNodePassword,
            onNext: () {
              controller.focusNodeConfirmPassword.requestFocus();
            },
          ),
           SizedBox(height: 16.h),
          AuthInput(
            controller: controller.confirmNewPassword,
            isPassword: true,
            hintText: 'Confirm new password'.tr,
            fillColor: ColorResources.COLOR_EAEAEA.withOpacity(0.53),
            focusNode: controller.focusNodeConfirmPassword,
          ),
          SizedBox(height: 106.h),
          CustomButton(
            label: 'Change password'.tr,
            callBack: () {
              controller.onResetPassword();
            },
            backgroundColor: ColorResources.COLOR_3B71CA,
          ),
        ],
      ),
    );
  }
}
