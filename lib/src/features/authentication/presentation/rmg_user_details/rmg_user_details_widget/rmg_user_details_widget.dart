import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/cached_image.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';

class RmgDetailWidget extends StatelessWidget {
  final String? userName;
  final String? userId;
  final String? userPicture;
  final bool? isDetailBtnShown;
  final VoidCallback detailBtnFunc;

  const RmgDetailWidget(
      {super.key,
      this.userId,
      this.userName,
      this.userPicture,
      this.isDetailBtnShown,
      required this.detailBtnFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0.w),
          border: Border.all(color: Colors.transparent),
        ),
        alignment: Alignment.center,
        child: Column(children: [
          Container(
              width: 400.w,
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0.w),
                border: Border.all(color: Colors.transparent),
              ),
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2.0.w),
                      ),
                      child: ClipOval(
                          child: CachedImage(
                        height: 100.h,
                        imgUrl: userPicture ?? "",
                      )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      userName ?? "",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    Text(
                      userId ?? "",
                      style: TextStyle(
                          fontSize: 15.sp, color: AppColors.textColor),
                    ),
                  ])),
          (isDetailBtnShown != null && isDetailBtnShown!)
              ? GestureDetector(
                  onTap: detailBtnFunc,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.0.w),
                      // Adjust the radius value as needed
                      border: Border.all(),
                    ),
                    child: Text(
                      AppString.detailsSee,
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                  ),
                )
              : Container(),
        ]));
  }
}
