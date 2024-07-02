import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/config/routes/route_path/home_routers.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/presentation/pages/home/home_controller.dart';
import 'package:template/presentation/pages/home/widgets/widget_daily_income.dart';
import 'package:template/presentation/pages/home/widgets/widget_item_feedback.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_F0F7FF,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      color: ColorResources.PRIMARY_1,
      padding: EdgeInsets.only(top: 44.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        child: Row(
          children: [
            ClipOval(
                child: IZIImage(
              '',
              width: 36.w,
            )),
            SizedBox(width: 7.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'welcome_back'.tr,
                  style: AppText.text12.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorResources.COLOR_E5DAFD),
                ),
                Text(
                  'Trần Hồng Ngọc',
                  style: AppText.text16.copyWith(
                      fontWeight: FontWeight.w700, color: ColorResources.WHITE),
                )
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.toNamed(HomeRoute.NOTIFICATION);
              },
              child: IZIImage(ImagesPath.icBell),
            ),
            SizedBox(width: 10.w),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                child: IZIImage(
                  ImagesPath.icMenu,
                  width: 21.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.only(left: 14.w, top: 10.h, right: 14.w),
      child: Column(
        children: [
          buildAppointments(),
          buildDailyIncome(),
          buildFeedback(),
        ],
      ),
    );
  }

  Widget buildAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'appointments'.tr,
          style: AppText.text14.copyWith(fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            children: [
              IZIImage(
                ImagesPath.icCalendar,
                width: 20.w,
              ),
              SizedBox(width: 7.w),
              RichText(
                text: TextSpan(
                  text: 'you_have'.tr,
                  style: AppText.text10.copyWith(fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' 6 ',
                      style: AppText.text10.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ColorResources.COLOR_FA6900),
                    ),
                    TextSpan(
                      text: 'appointments_customer'.tr,
                      style:
                          AppText.text10.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              buildViewAll('view_all', () {}),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(child: buildItemAppointments()),
            SizedBox(width: 5.w),
            Expanded(child: buildItemAppointments()),
          ],
        )
      ],
    );
  }

  Widget buildItemAppointments() {
    return Container(
      padding: EdgeInsets.only(left: 13.w, top: 9.h, bottom: 9.h, right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            ColorResources.COLOR_C9F5FF.withOpacity(0.84),
            ColorResources.COLOR_D0E6FF.withOpacity(0.82),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: IZIImage(
                  '',
                  width: 45.w,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                children: [
                  Text(
                    'Nhu Quynh',
                    style: AppText.text12.copyWith(
                        fontWeight: FontWeight.w700,
                        color: ColorResources.OUTER_SPACE),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '+1201888121',
                    style: AppText.text10.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorResources.COLOR_0095E9),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 7.h),
            child: Row(
              children: [
                IZIImage(ImagesPath.icClock, width: 16.w),
                SizedBox(width: 5.w),
                Text(
                  '8:20am',
                  style: AppText.text10.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorResources.COLOR_1255B9),
                )
              ],
            ),
          ),
          Row(
            children: [
              ClipOval(
                  child: Container(
                width: 3.w,
                height: 3.w,
                color: ColorResources.COLOR_A4A2A2,
              )),
              SizedBox(width: 4.5.w),
              Text(
                'service'.tr,
                style: AppText.text10.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorResources.COLOR_535354),
              ),
              Text(
                'Pedicure X2, Fix Nail',
                style: AppText.text10.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorResources.COLOR_535354),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildViewAll(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            text.tr,
            style: AppText.text12.copyWith(
                color: ColorResources.COLOR_1255B9,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 5.w),
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: ColorResources.COLOR_1255B9,
            ),
          )
        ],
      ),
    );
  }

  Widget buildDailyIncome() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'daily_income'.tr,
                style: AppText.text14.copyWith(fontWeight: FontWeight.w700),
              ),
              buildViewAll('view_detail', () {}),
            ],
          ),
          WidgetDailyIncome(),
        ],
      ),
    );
  }

  Widget buildFeedback() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'feed_back'.tr,
              style: AppText.text14.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              ' (2 ${'feed_back_s'.tr})',
              style: AppText.text10.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ColorResources.COLOR_A4A2A2),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            children: [
              RatingBarIndicator(
                rating: 4.4,
                itemPadding: EdgeInsets.only(bottom: 4.h, left: 4.w),
                itemBuilder: (context, index) => IZIImage(
                  ImagesPath.icStar,
                ),
                itemSize: 12,
              ),
              SizedBox(width: 6.w),
              Text(
                '4.4/5',
                style: AppText.text14.copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              buildViewAll('see_all', () {}),
            ],
          ),
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: WidgetItemFeedback(),
              );
            })
      ],
    );
  }
}
