import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';

class WidgetItemFeedback extends StatelessWidget {
  const WidgetItemFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorResources.WHITE,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: IZIImage('', width: 53.w, height: 53.w),
                ),
                SizedBox(width: 9.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ngô Ngọc Bảo Anh',
                      style: AppText.text14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorResources.COLOR_333334),
                    ),
                    SizedBox(height: 8.w),
                    Text(
                      '0377891* * *',
                      style: AppText.text12.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorResources.COLOR_8A92A6),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 5.h),
              child: RatingBarIndicator(
                rating: 5,
                itemPadding: EdgeInsets.only(bottom: 4.h, left: 4.w),
                itemBuilder: (context, index) => Image.asset(
                  ImagesPath.icStar,
                  color: ColorResources.COLOR_FFC833,
                ),
                itemSize: 16,
              ),
            ),
            Text(
              'Nhân viên nhiệt tình, thân thiện...',
              style: AppText.text12.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorResources.COLOR_535354),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h, right: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Massage body, Làm trắng da, Nâng cơ',
                    style: AppText.text11.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorResources.COLOR_A4A2A2),
                  ),
                  Text(
                    '10-03-2022 15:30',
                    style: AppText.text10.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorResources.COLOR_A4A2A2),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
