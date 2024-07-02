import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/data/model/provider/provider_model.dart';

class ItemProvider extends StatelessWidget {
  final ProviderModel provider;
  final Function() onTap;

  const ItemProvider({super.key, required this.provider, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: ColorResources.COLOR_F6F6F7,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: IZIImage(
                provider.thumbnail ?? '',
                width: 54.w,
                height: 54.w,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 54.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      provider.name ?? '',
                      style: AppText.text16.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorResources.COLOR_535354,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      provider.addressWithCityState,
                      style: AppText.text12.copyWith(
                        color: ColorResources.COLOR_535354,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
