import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/config/export/config_export.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/look_up_data.dart';
import 'package:template/data/model/countries/country_model.dart';
import 'package:template/presentation/pages/auth/forgot_password/forgot_password_controller.dart';
import 'package:template/presentation/pages/auth/login/login_controller.dart';
import 'package:template/presentation/pages/auth/register/register_controller.dart';
import 'package:template/presentation/pages/auth/widgets/appbar_auth.dart';
import 'package:template/presentation/pages/auth/widgets/auth_input.dart';
import 'package:template/presentation/widgets/custom_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IgnorePointer(
        ignoring: controller.ignoring.value,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarAuth(title: 'LOGIN'.tr),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Image.asset(ImagesPath.imageLogin, width: 265.w),
                Text.rich(
                  TextSpan(children: [
                    WidgetSpan(
                      child: Text(
                        '${'Welcome to'.tr} ',
                        style: AppText.text14.copyWith(
                          color: ColorResources.COLOR_464647,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: Text(
                        'Wilmot Nails',
                        style: AppText.text14.copyWith(
                          color: ColorResources.COLOR_1255B9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 25.h),
                _buildLoginWithPhone(),
                SizedBox(height: 18.h),
                Obx(
                  () => Row(
                    children: [
                      Transform.scale(
                        alignment: Alignment.centerRight,
                        scale: 1.2,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          checkColor: ColorResources.COLOR_1255B9,
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                                color: controller.isRemember
                                    ? ColorResources.COLOR_1255B9
                                    : ColorResources.GREY),
                          ),
                          value: controller.isRemember,
                          activeColor: ColorResources.WHITE,
                          onChanged: (val) {
                            if (val != null) {
                              controller.isRemember = val;
                            }
                          },
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      const SizedBox(width: IZISizeUtil.SPACE_1X),
                      Text(
                        'Remember Account'.tr,
                        style: AppText.text14.copyWith(
                          color: ColorResources.COLOR_464647,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),
                CustomButton(
                  label: 'Login'.tr,
                  callBack: () {
                    controller.onLogin();
                  },
                  backgroundColor: ColorResources.COLOR_3B71CA,
                ),
                const SizedBox(height: IZISizeUtil.SPACE_3X),
                InkWell(
                  onTap: () {
                    if (Get.isRegistered<ForgotPasswordController>()) {
                      Get.delete<ForgotPasswordController>();
                    }
                    Get.toNamed(AppRoute.FORGOT_PASSWORD, arguments: {
                      'country': controller.country,
                      'phoneNumber': controller.phoneNumber.text.trim(),
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      'Forgot Password ?'.tr,
                      style: AppText.text14.copyWith(
                        color: ColorResources.COLOR_1255B9,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: IZISizeUtil.SPACE_2X),
                Text.rich(
                  TextSpan(children: [
                    WidgetSpan(
                      child: InkWell(
                        onTap: () {
                          if (Get.isRegistered<RegisterController>()) {
                            Get.delete<RegisterController>();
                          }
                          Get.toNamed(AppRoute.REGISTER);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            '${'You don’t have account?'.tr} ',
                            style: AppText.text14.copyWith(
                              color: ColorResources.COLOR_464647,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: InkWell(
                        onTap: () {
                          if (Get.isRegistered<RegisterController>()) {
                            Get.delete<RegisterController>();
                          }
                          Get.toNamed(AppRoute.REGISTER);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            'Register now'.tr,
                            style: AppText.text14.copyWith(
                              color: ColorResources.COLOR_1255B9,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginWithPhone() {
    return Column(
      children: [
        AuthInput(
          controller: controller.storeCode,
          fillColor: ColorResources.COLOR_A4A2A2.withOpacity(0.1),
          hintText: 'Store Code'.tr,
          focusNode: controller.focusNodeStoreCode,
          onNext: () {
            controller.focusNodePhone.requestFocus();
          },
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          prefixIcon: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 95.w,
                  alignment: Alignment.center,
                  child: Image.asset(ImagesPath.icPassword,
                      width: 25.w, height: 25.h),
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
            ),
          ),
        ),
        const SizedBox(height: IZISizeUtil.SPACE_2X),
        AuthInput(
          controller: controller.phoneNumber,
          hintText: 'Your phone number'.tr,
          fillColor: ColorResources.COLOR_A4A2A2.withOpacity(0.1),
          prefixIcon: IntrinsicHeight(
            child: _buildPrefixPhoneInput(),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onNext: () {
            controller.focusNodePassword.requestFocus();
          },
          focusNode: controller.focusNodePhone,
        ),
        const SizedBox(height: IZISizeUtil.SPACE_2X),
        AuthInput(
          isPassword: true,
          fillColor: ColorResources.COLOR_A4A2A2.withOpacity(0.1),
          controller: controller.password,
          hintText: 'Password'.tr,
          focusNode: controller.focusNodePassword,
          prefixIcon: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 95.w,
                  alignment: Alignment.center,
                  child: Image.asset(ImagesPath.icPassword,
                      width: 25.w, height: 25.h),
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
            ),
          ),
        ),
      ],
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
