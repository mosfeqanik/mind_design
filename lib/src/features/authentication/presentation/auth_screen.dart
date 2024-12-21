import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_room/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:next_room/src/utils/app_assets.dart';
import 'package:next_room/src/utils/app_colors.dart';
import 'package:next_room/src/utils/app_strings.dart';
import 'package:next_room/src/utils/themes_styles.dart';

import '../../../core/widgets/btn_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                ),
              ),
              Center(
                child: Image.asset(
                  AppAssets.mindDesignLogo,
                  height: 88.h,
                  width: 68.w,
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Text(
                AppString.letsBegin,
                style: AppTextStyle.allMainTitleTextStyle,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                AppString.startJourney,
                style: AppTextStyle.allMainSubTitleTextStyle,
              ),
              SizedBox(
                height: 40.h,
              ),
              ButtonWidget(
                  btnIcon: null,
                  btnTitle: AppString.signUpOption(AppString.email),
                  btnColor: AppColors.buttonColor,
                  btnTextColor: AppColors.whiteColor,
                  width: double.infinity,
                  height: 56.h,
                  btnFunc: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  }),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 148.w,
                    height: 1,
                    decoration: BoxDecoration(
                      color: AppColors.dividerColor,
                    ),
                  ),
                  Text(
                    AppString.or,
                    style: AppTextStyle.allMainSubTitleTextStyle.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Container(
                    width: 148.w,
                    height: 1,
                    decoration: BoxDecoration(
                      color: AppColors.dividerColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              ButtonWidget(
                  btnIcon: AppAssets.googleIcon,
                  btnTitle: AppString.signUpOption(AppString.google),
                  btnColor: AppColors.authBgColor,
                  btnTextColor: AppColors.whiteColor,
                  width: double.infinity,
                  height: 56.h,
                  btnFunc: () {}),
              SizedBox(
                height: 16.h,
              ),
              ButtonWidget(
                  btnIcon: AppAssets.appleIcon,
                  btnTitle: AppString.signUpOption(AppString.apple),
                  btnColor: AppColors.authBgColor,
                  btnTextColor: AppColors.whiteColor,
                  width: double.infinity,
                  height: 56.h,
                  btnFunc: () {}),
              SizedBox(
                height: 135.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppString.alreadyAccount,
                      style: AppTextStyle.allMainSubTitleTextStyle),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      AppString.signIn,
                      style: AppTextStyle.allMainSubTitleTextStyle.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
