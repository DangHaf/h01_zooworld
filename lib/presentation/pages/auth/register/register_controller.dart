import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/config/routes/route_path/app_routers.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/utils/look_up_data.dart';
import 'package:template/data/model/auth/auth_request.dart';
import 'package:template/data/model/auth/auth_response.dart';
import 'package:template/data/model/countries/country_model.dart';
import 'package:template/data/repositories/auth_repository.dart';
import 'package:template/presentation/pages/auth/login/login_controller.dart';
import 'package:template/presentation/pages/auth/otp/otp_controller.dart';

class RegisterController extends GetxController {
  final AuthRepository _authRepository = GetIt.I.get<AuthRepository>();

  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  FocusNode focusNodePhone = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeConfirmPassword = FocusNode();
  FocusNode focusNodeName = FocusNode();

  final Rx<Country> _country = LookUpData.country.obs;

  Country get country => _country.value;
  TextEditingController searchDialCode = TextEditingController();

  RxBool ignoring = false.obs;
  PhoneCountry? phoneCountry;
  bool isRegisterBefore = true;

  Future<void> onRegister() async {
    if (isValidRegister) {
      ignoring.value = true;
      await _checkPhone();
      if (phoneCountry != null) {
        if (!phoneCountry!.isValid) {
          IZIAlert().error(message: 'Invalid phone number'.tr);
        } else {
          await _checkPhoneWithRegister();
          if (!isRegisterBefore) {
            IZIAlert().error(
                message: 'This phone number has been registered previously'.tr);
          } else {
            final RegisterRequest authRequest = RegisterRequest(
              fullName: name.text.trim(),
              phone: phoneCountry!.phoneNumber!,
              countryCode: country.alpha2Code!,
              password: password.text.trim(),
            );

            if (LookUpData.setting.isOTPRegister) {
              if(Get.isRegistered<OTPController>()){
                Get.delete<OTPController>();
              }
              Get.toNamed(AppRoute.OTP, arguments: {
                'phoneNumberNational': phoneCountry!.phoneNumber,
                'phoneNumber': phoneNumber.text.trim(),
                'isFromRegister': true,
                'registerRequest': authRequest,
                'country': country,
              });
            } else {
              EasyLoading.show(status: 'Creating account...'.tr);
              await _authRepository.signupPhone(
                data: authRequest,
                onSuccess: () async {
                  final loginController = Get.find<LoginController>();
                  loginController.country = country;
                  loginController.password.text = password.text;
                  loginController.phoneNumber.text = phoneNumber.text;
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
            }
          }
        }
      }
      ignoring.value = false;
    }
  }

  set country(Country country) {
    _country.value = country;
  }

  Future<void> _checkPhone() async {
    EasyLoading.show(status: 'Checking phone number...'.tr);
    await _authRepository.checkPhone(
      phoneNumber: phoneNumber.text.trim(),
      country: country.alpha2Code!,
      onSuccess: (data) {
        phoneCountry = data;
      },
      onError: (error) {
        IZIAlert().error(message: error.toString());
      },
    );
    EasyLoading.dismiss();
  }

  Future<void> _checkPhoneWithRegister() async {
    EasyLoading.show(status: 'Checking phone number...'.tr);
    await _authRepository.checkAccountWithPhone(
      phoneNumber: phoneCountry!.phoneNumber!,
      onSuccess: (data) {
        isRegisterBefore = data;
      },
      onError: (error) {
        IZIAlert().error(message: error.toString());
      },
    );
    EasyLoading.dismiss();
  }

  bool get isValidRegister {
    if (name.text.trim().isEmpty) {
      IZIAlert().error(message: 'Your full name is required'.tr);
      return false;
    }
    if (phoneNumber.text.isEmpty) {
      IZIAlert().error(message: 'Your phone number is required'.tr);
      return false;
    }
    if (password.text.isEmpty) {
      IZIAlert().error(message: 'Your password is required'.tr);
      return false;
    }
    if (password.text.trim().length < 6) {
      IZIAlert()
          .error(message: 'Your password must have at least 6 characters.'.tr);
      return false;
    }
    if (confirmPassword.text.isEmpty) {
      IZIAlert().error(message: 'Confirm your password is required'.tr);
      return false;
    }
    if (confirmPassword.text.trim() != password.text.trim()) {
      IZIAlert().error(message: 'Your passwords do not match'.tr);
      return false;
    }
    return true;
  }
}
