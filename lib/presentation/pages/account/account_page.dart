import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/presentation/pages/account/account_controller.dart';
import 'package:template/presentation/pages/account/widgets/bottom_change_language.dart';
import 'package:template/presentation/pages/account/widgets/dialog_confirm.dart';
import 'package:template/presentation/pages/account/widgets/item_action_account.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: ColorResources.BACK_GROUND_2,
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: IZISizeUtil.PADDING_HORIZONTAL_HOME,
        vertical: 8.h,
      ),
      child: Obx(
        () => IgnorePointer(
          ignoring: controller.ignoring.value,
          child: Column(
            children: [
              ItemActionAccount(
                title: 'account_001'.tr,
                icon: ImagesPath.icPersonalInformation,
                callBack: () {
                },
              ),
              SizedBox(height: 8.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Column(
                  children: [
                    ItemActionAccount(
                      title: 'account_002'.tr,
                      icon: ImagesPath.icPolicy,
                      isBorder: false,
                      callBack: () {},
                    ),
                    Divider(
                      height: 0,
                      thickness: 0.25,
                      color: ColorResources.COLOR_B1B1B1,
                      endIndent: IZISizeUtil.PADDING_HORIZONTAL_HOME,
                      indent: IZISizeUtil.PADDING_HORIZONTAL_HOME,
                    ),
                    ItemActionAccount(
                      title: 'account_005'.tr,
                      icon: ImagesPath.icLanguage,
                      isBorder: false,
                      callBack: () {
                        Get.bottomSheet(
                          isDismissible: true,
                          BottomChangeLanguage(
                              language: controller.key.value,
                              callBack: (language, key) {
                                controller.changeLanguage(language, key);
                              }),
                        );
                      },
                      subWidget: Row(
                        children: [
                          Obx(
                            () => Text(
                              controller.language,
                              style: AppText.text12.copyWith(
                                color: ColorResources.COLOR_1255B9,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: ColorResources.COLOR_1255B9,
                            size: 10.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Column(
                  children: [
                    ItemActionAccount(
                      title: 'account_007'.tr,
                      icon: ImagesPath.icDeleteAccount,
                      isBorder: false,
                      callBack: () {
                        Get.dialog(
                          DialogConfirm(
                            icon: ImagesPath.icActionDelete,
                            title: 'account_013'.tr,
                            content: 'account_014'.tr,
                            onConfirm: () {
                              controller.deleteAccount();
                            },
                          ),
                        );
                      },
                    ),
                    Divider(
                      height: 0,
                      thickness: 0.25,
                      color: ColorResources.COLOR_B1B1B1,
                      endIndent: IZISizeUtil.PADDING_HORIZONTAL_HOME,
                      indent: IZISizeUtil.PADDING_HORIZONTAL_HOME,
                    ),
                    ItemActionAccount(
                      title: 'account_008'.tr,
                      icon: ImagesPath.icLogout,
                      isBorder: false,
                      callBack: () {
                        Get.dialog(
                          DialogConfirm(
                            icon: ImagesPath.icActionLogout,
                            title: 'account_016'.tr,
                            content: 'account_017'.tr,
                            onConfirm: () {
                              controller.logout();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 175.h,
      child: Stack(
        children: [
          Container(
            height: 140.h,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xff5C91F7).withOpacity(0.84),
                  const Color(0xff2A65FC).withOpacity(0.83),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: IZISizeUtil.PADDING_HORIZONTAL_HOME,
            right: IZISizeUtil.PADDING_HORIZONTAL_HOME,
            child: InkWell(
              borderRadius: BorderRadius.circular(8.r),
              onTap: () {
                // Get.toNamed(
                //   AppRoute.PERSONAL_INFORMATION,
                //   arguments: controller.user,
                // );
              },
              child: Container(
                height: 80.h,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white),
                padding: EdgeInsets.symmetric(
                  horizontal: IZISizeUtil.PADDING_HORIZONTAL_HOME,
                ),
                child: Obx(
                  () => Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: controller.user.avatar ?? '',
                          fadeOutDuration: Duration.zero,
                          fadeInDuration: Duration.zero,
                          width: 42.r,
                          height: 42.r,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 25.sp,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.user.fullName ?? '',
                            style: AppText.text14.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            controller.user.phone ?? '',
                            style: AppText.text14.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
