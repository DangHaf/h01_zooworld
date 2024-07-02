import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/presentation/pages/auth/otp/otp_controller.dart';
import 'package:template/presentation/pages/auth/widgets/appbar_auth.dart';
import 'package:template/presentation/pages/auth/widgets/oval_painter.dart';
import 'package:template/presentation/widgets/custom_button.dart';

class OTPPage extends GetView<OTPController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IgnorePointer(
        ignoring: controller.ignoring.value,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarAuth(title: 'SMS VERIFICATION'.tr),
          body: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Image.asset(ImagesPath.imageOtp, width: 260.w),
          Text(
            'A 4 digit code has been sent to your registered phone number ending 2235 for verification purpose'
                .tr,
            style: AppText.text12.copyWith(
              color: ColorResources.COLOR_FA6900,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          CustomPaint(
            painter: OvalPainter(height: 600.h, width: 615.w),
            child: Column(
              children: [
                SizedBox(height: 100.h),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: controller.otpController,
                  onChanged: (value) {},
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50.r,
                    fieldWidth: (Get.width - 40.w - 44) / 6,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    inactiveColor: Colors.white,
                    activeColor: Colors.white,
                    selectedFillColor: Colors.white,
                    selectedColor: ColorResources.COLOR_FA6900,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  textStyle: AppText.text22.copyWith(
                    color: ColorResources.COLOR_464647,
                  ),
                ),
                SizedBox(height: 20.h),
                Obx(
                  () => Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Please wait'.tr,
                        style: AppText.text14.copyWith(
                          color: ColorResources.COLOR_1255B9,
                        ),
                      ),
                      TextSpan(
                        text: ' ${controller.count.value}s ',
                        style: AppText.text14.copyWith(
                          color: ColorResources.COLOR_FA6900,
                        ),
                      ),
                      TextSpan(
                        text: 'to receive the confirmation code again!'.tr,
                        style: AppText.text14.copyWith(
                          color: ColorResources.COLOR_1255B9,
                        ),
                      ),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  label: 'Verify'.tr,
                  callBack: () {
                    controller.onConfirm();
                  },
                  backgroundColor: ColorResources.COLOR_3B71CA,
                ),
                SizedBox(height: 26.h),
                if (!controller.ignoringSendOTP.value)
                  InkWell(
                    onTap: () {
                      controller.onClickOtpSendAgain();
                    },
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text.rich(
                        TextSpan(children: [
                          WidgetSpan(
                            child: Text(
                              '${'Haven’t received code?'.tr} ',
                              style: AppText.text14.copyWith(
                                color: ColorResources.COLOR_464647,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          WidgetSpan(
                            child: Text(
                              'Resend code'.tr,
                              style: AppText.text14.copyWith(
                                color: ColorResources.COLOR_1255B9,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
