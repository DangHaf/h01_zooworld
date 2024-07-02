import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';

class ItemNavigation extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  final Function() callBack;

  const ItemNavigation({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callBack,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            color: isSelected
                ? ColorResources.COLOR_1255B9
                : ColorResources.COLOR_535354,
            width: 28.r,
            height: 28.r,
          ),
          Text(
            title,
            style: AppText.text10.copyWith(
              color: isSelected
                  ? ColorResources.COLOR_1255B9
                  : ColorResources.COLOR_535354,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
