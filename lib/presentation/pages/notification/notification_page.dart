import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/presentation/pages/notification/notification_controller.dart';

class NotificationPage extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'notification'.tr,
      ),
      body: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.only(bottom: 20.h),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return buildItem(index);
          }),
    );
  }

  Widget buildItem(int index) {
    return InkWell(
      onTap: () {
        controller.isRead.value = !controller.isRead.value;
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
              color: index % 2 == 0
                  ? ColorResources.COLOR_FFFAEA
                  : ColorResources.WHITE,
              border: const Border(
                  bottom: BorderSide(
                      width: 0.25, color: ColorResources.PRIMARY_1))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              children: [
                IZIImage(
                  ImagesPath.icBellAround,
                  colorIconsSvg: controller.isRead.value
                      ? null
                      : ColorResources.COLOR_FA6900,
                ),
                SizedBox(width: 7.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.784,
                      child: Text(
                        'You have new cleaning schedule on Monday, Jan 27th 2024, from 7:30am to 7:50am.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.text12.copyWith(
                            fontWeight: controller.isRead.value
                                ? FontWeight.w400
                                : FontWeight.w700,
                            color: controller.isRead.value
                                ? ColorResources.OUTER_SPACE
                                : ColorResources.COLOR_535354),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          size: 13,
                          color: ColorResources.COLOR_A4A2A2,
                        ),
                        Text(
                          '24-12-2023 - 7:49pm',
                          style: AppText.text10.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ColorResources.COLOR_A4A2A2),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
