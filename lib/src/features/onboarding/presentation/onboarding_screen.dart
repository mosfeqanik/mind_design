import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_room/src/core/widgets/btn_widget.dart';
import 'package:next_room/src/features/authentication/presentation/auth_screen.dart';
import 'package:next_room/src/utils/app_assets.dart';
import 'package:next_room/src/utils/app_colors.dart';
import 'package:next_room/src/utils/app_strings.dart';
import 'package:next_room/src/utils/themes_styles.dart';

class OnboardingBoard extends StatelessWidget {
  const OnboardingBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onBoardingBgColor,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Image.asset(
                AppAssets.listingSongOnboarding,
                height: 328.h,
                width: 343.w,
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(AppString.welcomeMindDesign,
                  style: AppTextStyle.allMainTitleTextStyle),
              SizedBox(
                height: 8.h,
              ),
              Text(AppString.discoverTranquility,
                  style: AppTextStyle.allMainSubTitleTextStyle),
              SizedBox(
                height: 170.h,
              ),
              ButtonWidget(
                  btnIcon: null,
                  btnTitle: AppString.next,
                  btnColor: AppColors.buttonColor,
                  btnTextColor: AppColors.whiteColor,
                  width: double.infinity,
                  height: 56.h,
                  btnFunc: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthScreen()));
                  })
            ],
          ),
        ),
      )),
    );
  }
}
