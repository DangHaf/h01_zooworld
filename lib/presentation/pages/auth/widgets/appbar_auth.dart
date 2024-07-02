import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';

class AppBarAuth extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isShowLeading;
  const AppBarAuth({
    super.key,
    required this.title,
    this.isShowLeading = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 68.w,
      toolbarHeight: 60.h,
      leading: isShowLeading ? Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 24.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorResources.COLOR_464647.withOpacity(0.1),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 22.sp,
            ),
          ),
        ),
      ) : const SizedBox(),
      centerTitle: true,
      title: Text(
        title,
        style: AppText.text18.copyWith(
            fontWeight: FontWeight.w700, color: ColorResources.COLOR_535354),
      ),
    );
  }
}
