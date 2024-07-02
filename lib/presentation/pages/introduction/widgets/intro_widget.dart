import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';

class IntroWidget extends StatelessWidget {
  final String title;
  final String content;
  final String image;

  const IntroWidget({
    super.key,
    required this.title,
    required this.content,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: Get.width,
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppText.text30.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ColorResources.COLOR_1255B9,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: AppText.text16.copyWith(
                    color: ColorResources.COLOR_535354,
                  ),
                ),
              ),
            ),
            Expanded(flex: 6, child: Image.asset(image, width: Get.width)),
            const Expanded(flex: 2, child: SizedBox())
          ],
        ),
      ),
    );
  }
}
