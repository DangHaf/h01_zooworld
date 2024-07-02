import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/config/routes/route_path/app_routers.dart';
import 'package:template/core/helper/izi_alert.dart';
import 'package:template/data/model/auth/auth_request.dart';
import 'package:template/data/model/countries/country_model.dart';
import 'package:template/data/repositories/auth_repository.dart';
import 'package:template/presentation/pages/auth/login/login_controller.dart';

class ResetPasswordController extends GetxController {
  final AuthRepository _authRepository = GetIt.I.get<AuthRepository>();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeConfirmPassword = FocusNode();

  RxBool ignoring = false.obs;

  late String phoneNumberNational;
  late String phoneNumber;
  late Country country;
  String? otpCode;

  @override
  void onInit() {
    phoneNumberNational = Get.arguments['phoneNumberNational'] as String;
    phoneNumber = Get.arguments['phoneNumber'] as String;
    if (Get.arguments['country'] != null) {
      country = Get.arguments['country'] as Country;
    }

    if (Get.arguments['otpCode'] != null) {
      otpCode = Get.arguments['otpCode'] as String;
    }
    super.onInit();
  }

  Future<void> onResetPassword() async {
    if (!isValidReset) {
      return;
    }
    ignoring.value = true;
    EasyLoading.show(status: 'Updating password...'.tr);
    final ResetPassWordRequest request = ResetPassWordRequest(
      phone: phoneNumberNational,
      password: newPassword.text.trim(),
      otpCode: otpCode,
      storeUserType: 'CUSTOMER',
    );
    await _authRepository.resetPassword(
      data: request,
      onSuccess: () async {
        IZIAlert().success(message: 'Password reset successfully.'.tr);
        final loginController = Get.find<LoginController>();
        loginController.country = country;
        loginController.password.text = newPassword.text;
        loginController.phoneNumber.text = phoneNumber;
        Navigator.popUntil(
          Get.context!,
              (route) => route.settings.name == AppRoute.LOGIN,
        );
      },
      onError: (error) {
        IZIAlert().error(message: error.toString());
      },
    );
    EasyLoading.dismiss();
    ignoring.value = false;
  }

  bool get isValidReset {
    if (newPassword.text.isEmpty) {
      IZIAlert().error(message: 'Password is required.'.tr);
      return false;
    }
    if (newPassword.text.trim().length < 6) {
      IZIAlert().error(message: 'Password must have at least 6 characters.'.tr);
      return false;
    }
    if (confirmNewPassword.text.isEmpty) {
      IZIAlert().error(message: 'Password confirmation is required.'.tr);
      return false;
    }
    if (confirmNewPassword.text.trim() != newPassword.text.trim()) {
      IZIAlert().error(message: 'Passwords do not match.'.tr);
      return false;
    }
    return true;
  }
}
