import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_room/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:next_room/src/features/home_screen/presentation/home_screen.dart';

import '/src/core/widgets/text_field_form_widget.dart';
import '/src/utils/app_assets.dart';
import '/src/utils/app_colors.dart';
import '/src/utils/app_strings.dart';
import '/src/utils/themes_styles.dart';
import '../../../core/widgets/btn_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
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
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  AppString.signIn,
                  style: AppTextStyle.allMainTitleTextStyle,
                ),
                SizedBox(
                  height: 32.h,
                ),
                TextFieldFormWidget(
                    // labelText: "Your Name",
                    hintText: AppString.enterEmail,
                    validatorFunc: (value) {},
                    edtTxtCntr: nameController,
                    isPassObscureText: false),
                SizedBox(
                  height: 16.h,
                ),
                TextFieldFormWidget(
                    // labelText: AppString.yourName,
                    hintText: AppString.password,
                    validatorFunc: (value) {},
                    edtTxtCntr: passwordController,
                    isPassObscureText: true),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppString.forgotPassword,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.allMainSubTitleTextStyle.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                ButtonWidget(
                    btnIcon: null,
                    btnTitle: AppString.signIn,
                    btnColor: AppColors.buttonColor,
                    btnTextColor: AppColors.whiteColor,
                    width: double.infinity,
                    height: 56.h,
                    btnFunc: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
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
                  height: 124.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppString.donTAccount,
                        style: AppTextStyle.allMainSubTitleTextStyle),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Text(
                        AppString.signUp,
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
      ),
    );
  }
}
