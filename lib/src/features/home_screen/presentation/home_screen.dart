import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_room/src/utils/app_assets.dart';
import 'package:next_room/src/utils/app_colors.dart';
import 'package:next_room/src/utils/app_strings.dart';
import 'package:next_room/src/utils/themes_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppString.recommended,
                style: AppTextStyle.allMainSubTitleTextStyle.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(4.r),
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.authBgColor,
                    borderRadius: BorderRadius.circular(8.r),
                    border:
                        Border.all(width: 1.w, color: AppColors.dividerColor)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/bg_images/mini_bg_image.png",
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.tides,
                          style: AppTextStyle.allMainSubTitleTextStyle.copyWith(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(AppString.learningLofi,
                            style: AppTextStyle.smallTextStyle),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      AppAssets.videoCircleIcon,
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 22.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.w,
              ),
              Text(
                AppString.selectMentalState,
                style: AppTextStyle.allMainSubTitleTextStyle.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 16.w,
              ),
              buildContainerWidget(
                  bgImage: AppAssets.recommendedBgImage,
                  titleText: AppString.hypnosisNow),
              SizedBox(
                height: 16.h,
              ),
              buildContainerWidget(
                  bgImage: AppAssets.bgImageTwo,
                  titleText: AppString.doLaserFocus),
              SizedBox(
                height: 16.h,
              ),
              buildContainerWidget(
                  bgImage: AppAssets.bgImageThree,
                  titleText: AppString.meditateNow),
              SizedBox(
                height: 16.h,
              ),
              buildContainerWidget(
                  bgImage: AppAssets.bgImageFour,
                  titleText: AppString.sleepNow),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainerWidget({
    required String bgImage,
    required String titleText,
  }) {
    return Container(
      padding: EdgeInsets.all(26.r),
      height: 130.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgImage),
          fit: BoxFit.cover,
        ),
        color: AppColors.authBgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: Text(
              titleText,
              style: AppTextStyle.normalTextStyle.copyWith(
                  color: AppColors.whiteColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
