import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/presentation/pages/introduction/introduction_controller.dart';
import 'package:template/presentation/pages/introduction/widgets/intro_widget.dart';

class IntroductionPage extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller.pageController,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (index) => controller.currentIndex = index,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  if (index == 0)
                    IntroWidget(
                      title: 'Get appoiments and schedules',
                      content:
                          'Easily manage and follow your appointment schedules with your customers.',
                      image: ImagesPath.imageIntro1,
                    )
                  else
                    index == 1
                        ? IntroWidget(
                            title: 'Offering day-off',
                            content:
                                'Conveniently offer working and day-off calendar with your manager.',
                            image: ImagesPath.imageIntro2,
                          )
                        : IntroWidget(
                            title: 'Tracking income and salary',
                            content:
                                'Track your daily income and monthly salaries.',
                            image: ImagesPath.imageIntro3,
                          ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 30.h,
            child: Obx(
              () => Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => controller.skipIntroduction(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: IZISizeUtil.SPACE_2X * 0.6),
                        child: Text(
                          'Skip'.tr,
                          style: AppText.text16.copyWith(
                            fontWeight: FontWeight.w700,
                            color: ColorResources.COLOR_3B71CA,
                          ),
                        ),
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: 3,
                      position: controller.currentIndex,
                      decorator: DotsDecorator(
                        color: ColorResources.COLOR_8A92A6,
                        activeColor: ColorResources.COLOR_1255B9,
                        spacing: EdgeInsets.all(2.w),
                        size: Size.square(7.r),
                        activeSize: Size(23.r, 7.r),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    if (controller.currentIndex == 2)
                      InkWell(
                        onTap: () => controller.goToLogin(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: IZISizeUtil.SPACE_2X * 0.6),
                          child: Text(
                            'Start'.tr,
                            style: AppText.text16.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ColorResources.COLOR_3B71CA,
                            ),
                          ),
                        ),
                      )
                    else
                      InkWell(
                        onTap: () => controller.onNextPage(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: IZISizeUtil.SPACE_2X * 0.6),
                          child: Text(
                            'Next'.tr,
                            style: AppText.text16.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ColorResources.COLOR_3B71CA,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
