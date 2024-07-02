import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';

class WidgetDailyIncome extends StatelessWidget {
  const WidgetDailyIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildItemDailyIncome(
                  'service_total', ColorResources.COLOR_ECFFCE),
              buildItemDailyIncome('tip_total', ColorResources.COLOR_FFCECE),
              buildItemDailyIncome(
                  'products_total', ColorResources.COLOR_CEDEFF),
              buildItemDailyIncome(
                  'discount_total', ColorResources.COLOR_FFCEF7),
            ],
          ),
          SizedBox(height: 9.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildItemDailyIncome('commission', ColorResources.COLOR_CEFFDC),
              buildItemDailyIncome(
                  'tip_for_staff', ColorResources.COLOR_E0CEFF),
              buildItemDailyIncome('profit_total', ColorResources.COLOR_FFEECE),
              buildItemDailyIncome(
                'turn_total',
                ColorResources.COLOR_72DDFF.withOpacity(0.46),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildItemDailyIncome(String text, Color color) {
    return Container(
      width: Get.width * 0.21,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        child: Column(
          children: [
            Text(
              '1525',
              style: AppText.text14.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              text.tr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.text10.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorResources.COLOR_535354),
            ),
          ],
        ),
      ),
    );
  }
}
