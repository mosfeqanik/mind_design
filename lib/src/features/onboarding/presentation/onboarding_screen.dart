import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/btn_widget.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/local_storage_manager.dart';
import '../../authentication/presentation/sign_in_screen/sign_in_screen.dart';

class OnboardingBoard extends StatelessWidget {
  const OnboardingBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.onboardingBg),
              fit: BoxFit.fitWidth,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BtnWidget(
                btnTitle: AppString.submit,
                btnFunc: () {
                  LocalStorageManager.saveData(AppConstants.onboarding, true);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppString.newUser,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      AppString.contactAdmin,
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 12.sp),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
