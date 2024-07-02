import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/look_up_data.dart';
import 'package:template/data/model/countries/country_model.dart';
import 'package:template/presentation/pages/auth/forgot_password/forgot_password_controller.dart';
import 'package:template/presentation/pages/auth/widgets/appbar_auth.dart';
import 'package:template/presentation/pages/auth/widgets/auth_input.dart';
import 'package:template/presentation/pages/auth/widgets/oval_painter.dart';
import 'package:template/presentation/widgets/custom_button.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IgnorePointer(
        ignoring: controller.ignoring.value,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarAuth(title: 'SMS VERIFICATION'.tr),
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
          Image.asset(ImagesPath.imageForgot, width: 260.w),
          CustomPaint(
            painter: OvalPainter(height: 470.h, width: 615.w),
            child: Column(
              children: [
                SizedBox(height: 70.h),
                Text(
                  'Enter your mobile phone number'.tr,
                  textAlign: TextAlign.center,
                  style: AppText.text18.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ColorResources.COLOR_1255B9,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'We will send you a confirmation code'.tr,
                  textAlign: TextAlign.center,
                  style: AppText.text14.copyWith(
                    color: ColorResources.COLOR_FA6900,
                  ),
                ),
                SizedBox(height: 40.h),
                AuthInput(
                  controller: controller.phoneNumber,
                  hintText: 'Your phone number'.tr,
                  prefixIcon: IntrinsicHeight(
                    child: _buildPrefixPhoneInput(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(height: 55.h),
                CustomButton(
                  label: 'Next'.tr,
                  callBack: () {
                    controller.onContinue();
                  },
                  backgroundColor: ColorResources.COLOR_3B71CA,
                ),
                SizedBox(height: 60.h),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Text.rich(
                      TextSpan(children: [
                        WidgetSpan(
                          child: Text(
                            '${'Remember password?'.tr} ',
                            style: AppText.text14.copyWith(
                              color: ColorResources.COLOR_464647,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Text(
                            'Login'.tr,
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
          )
        ],
      ),
    );
  }

  Widget _buildPrefixPhoneInput() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<Country>(
            customButton: Obx(
              () => Container(
                width: 95.w,
                padding:
                    const EdgeInsets.only(left: IZISizeUtil.SPACE_2X * 0.8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                      child: Center(
                          child: Image.asset(controller.country.flagUri)),
                    ),
                    const SizedBox(width: IZISizeUtil.SPACE_1X),
                    Expanded(
                      child: Text(
                        controller.country.dialCode.toString(),
                        style: AppText.text12.copyWith(
                          color: ColorResources.COLOR_464647,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: ColorResources.GREY,
                      size: 25,
                    )
                  ],
                ),
              ),
            ),
            dropdownSearchData: DropdownSearchData(
              searchInnerWidgetHeight: 0.0,
              searchController: controller.searchDialCode,
              searchInnerWidget: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                  right: 8,
                  left: 8,
                ),
                child: TextFormField(
                  controller: controller.searchDialCode,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 16,
                    ),
                    hintText: 'Search for a dial code...',
                    hintStyle: AppText.text12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: Get.height * 0.6,
              width: Get.width * 0.6,
            ),
            onChanged: (val) {
              controller.country = val!;
            },
            hint: const Text("Dial code"),
            value: controller.country,
            items: LookUpData.countryList
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40.w,
                            child: IZIImage(e.flagUri),
                          ),
                          const SizedBox(width: IZISizeUtil.SPACE_1X),
                          Text(
                            e.dialCode.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: VerticalDivider(
            thickness: 0.5,
            color: ColorResources.COLOR_A4A2A2.withOpacity(0.8),
            indent: 0,
            endIndent: 0,
            width: 0,
          ),
        ),
      ],
    );
  }
}
