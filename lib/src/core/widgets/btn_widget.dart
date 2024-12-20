import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_room/src/utils/app_colors.dart';

import '../../utils/themes_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String btnTitle;
  final String? btnIcon;
  final Color btnColor;
  final Color btnTextColor;
  final double width;
  final double height;
  final VoidCallback btnFunc;

  const ButtonWidget(
      {super.key,
      required this.btnTitle,
      required this.btnColor,
      required this.btnTextColor,
      required this.width,
      required this.height,
      required this.btnFunc,
      this.btnIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: btnFunc,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: btnIcon != null
              ? Border.all(width: 1, color: AppColors.dividerColor)
              : null,
          borderRadius: BorderRadius.circular(8.r),
          color: btnColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btnIcon != null
                ? Image.asset(
                    btnIcon!,
                    height: 24.h,
                    width: 24.w,
                  )
                : const SizedBox(),
            SizedBox(
              width: btnIcon != null ? 24.w : 0.w,
            ),
            Text(
              btnTitle,
              style: AppTextStyle.appTextStyle.copyWith(
                color: btnTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
