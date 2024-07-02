import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/config/routes/route_path/app_routers.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/data/model/auth/auth_request.dart';
import 'package:template/data/model/countries/country_model.dart';
import 'package:template/data/repositories/auth_repository.dart';
import 'package:template/presentation/pages/auth/login/login_controller.dart';

class OTPController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthRepository _authRepository = GetIt.I.get<AuthRepository>();
  TextEditingController otpController = TextEditingController();

  RxBool ignoring = false.obs;
  RxBool ignoringSendOTP = false.obs;

  Timer? timer;
  RxInt count = 60.obs;
  late String phoneNumberNational;
  late String phoneNumber;
  int resendToken = 0;
  String verificationId = '';
  String otpCode = '';

  bool isFromRegister = false;
  bool isFromForgotPassword = false;
  RegisterRequest? registerRequest;
  late Country country;

  @override
  void dispose() {
    super.dispose();
    otpController.clear();
    timer?.cancel();
  }

  @override
  void onInit() {
    phoneNumberNational = Get.arguments['phoneNumberNational'] as String;
    phoneNumber = Get.arguments['phoneNumber'] as String;
    if (Get.arguments['isFromRegister'] != null) {
      isFromRegister = Get.arguments['isFromRegister'] as bool;
    }
    if (Get.arguments['isFromForgotPassword'] != null) {
      isFromForgotPassword = Get.arguments['isFromForgotPassword'] as bool;
    }
    if (Get.arguments['registerRequest'] != null) {
      registerRequest = Get.arguments['registerRequest'] as RegisterRequest;
    }

    if (Get.arguments['country'] != null) {
      country = Get.arguments['country'] as Country;
    }
    super.onInit();
    _sendOTP();
    countDown();
  }

  Future<void> _sendOTP() async {
    await _sendOTPFirebase();
    final OTPRequest otp = OTPRequest(phone: phoneNumberNational);
    await _authRepository.sendOTP(
      data: otp,
      onSuccess: (registerToken) {
        otpCode = registerToken;
      },
      onError: (_) {},
    );
  }

  void countDown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count.value < 1) {
        ignoringSendOTP.value = false;
      } else {
        ignoringSendOTP.value = true;
        --count.value;
      }
    });
  }

  Future<void> _sendOTPFirebase() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumberNational,
      codeSent: (String verificationId, int? resendToken) async {
        this.resendToken = resendToken ?? 0;
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {},
      verificationFailed: (FirebaseAuthException error) {
        IZIAlert().error(message: error.toString());
      },
    );
  }

  void onClickOtpSendAgain() {
    count.value = 60;
    _sendOTP();
  }

  Future<void> onConfirm() async {
    ignoring.value = true;
    final res = await _verifyOTP();
    if (res) {
      if (isFromRegister) {
        await onRegister();
        return;
      }
      if (isFromForgotPassword) {
        Get.toNamed(AppRoute.RESET_PASSWORD, arguments: {
          'phoneNumberNational': phoneNumberNational,
          'phoneNumber': phoneNumber,
          'country': country,
          'otpCode': otpCode,
        });
      }
    }
    ignoring.value = false;
  }

  Future<bool> _verifyOTP() async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpController.text,
    );
    EasyLoading.show(status: 'Authenticating...'.tr);
    try {
      await _auth.signInWithCredential(credential);
      EasyLoading.dismiss();
      return true;
    } catch (error) {
      EasyLoading.dismiss();
      IZIAlert().error(message: 'Incorrect authentication code, please try again.'.tr);
      return false;
    }
  }

  Future<void> onRegister() async {
    EasyLoading.show(status: 'Creating account...'.tr);
    registerRequest?.otpCode = otpCode;
    await _authRepository.signupPhone(
      data: registerRequest!,
      onSuccess: () async {
        final loginController = Get.find<LoginController>();
        loginController.country = country;
        loginController.password.text = registerRequest?.password ?? '';
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
  }
}
