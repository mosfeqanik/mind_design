import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_room/src/core/widgets/text_field_form_widget.dart';
import 'package:next_room/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:next_room/src/utils/app_assets.dart';
import 'package:next_room/src/utils/app_colors.dart';
import 'package:next_room/src/utils/app_strings.dart';
import 'package:next_room/src/utils/themes_styles.dart';

import '../../../core/widgets/btn_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
                  AppString.createAccount,
                  style: AppTextStyle.allMainTitleTextStyle,
                ),
                SizedBox(
                  height: 32.h,
                ),
                TextFieldFormWidget(
                    // labelText: "Your Name",
                    hintText: AppString.yourName,
                    validatorFunc: (value) {},
                    edtTxtCntr: nameController,
                    isPassObscureText: false),
                SizedBox(
                  height: 16.h,
                ),
                TextFieldFormWidget(
                    // labelText: "Your Name",
                    hintText: AppString.yourEmail,
                    validatorFunc: (value) {},
                    edtTxtCntr: emailController,
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
                Text(
                  AppString.communityPrivacyServices,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.smallTextStyle,
                ),
                SizedBox(
                  height: 24.h,
                ),
                ButtonWidget(
                    btnIcon: null,
                    btnTitle: AppString.signUp,
                    btnColor: AppColors.buttonColor,
                    btnTextColor: AppColors.whiteColor,
                    width: double.infinity,
                    height: 56.h,
                    btnFunc: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
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
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xFF6633CC),
                        Color(0xFFE31981),
                      ])),
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
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color(0xFFE31981),
                        Color(0xFF6633CC),
                      ])),
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
                  height: 27.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppString.alreadyAccount,
                        style: AppTextStyle.allMainSubTitleTextStyle),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
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
      ),
    );
  }
}
