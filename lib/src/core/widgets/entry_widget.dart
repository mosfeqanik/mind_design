import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class EntryWidget extends StatelessWidget {
  final String? images;
  final String? titleText;
  final String? subTitleText;
  final String? btnText;
  final VoidCallback onPressedFnc;

  const EntryWidget(
      {super.key,
      this.images,
      this.titleText,
      this.subTitleText,
      required this.onPressedFnc,
      this.btnText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.h),
        child: Container(
          height: 177.h,
          width: 158.w,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  images!,
                  height: 32.h,
                  width: 32.w,
                ),
                Text(
                  titleText!,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000)),
                ),
                Text(
                  subTitleText!,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF777070)),
                ),
                GestureDetector(
                  onTap: onPressedFnc,
                  child: Container(
                    alignment: Alignment.center,
                    height: 33.h,
                    width: 126.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: const Color(0xFFEAEEF4)),
                    child: Text(
                      btnText!,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
