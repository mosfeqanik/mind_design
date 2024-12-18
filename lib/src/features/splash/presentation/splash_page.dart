import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/local_storage_manager.dart';
import '../../authentication/presentation/sign_in_screen/sign_in_screen.dart';
import '../../onboarding/presentation/onboarding_screen.dart';
import '../provider/splash_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final initializationProvider = Provider.of<InitializationProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: FutureBuilder<void>(
        future: initializationProvider.initializationFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // navigateUser(context);
            });
            return _splash(context);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'An error occurred. Please try again later.',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            return _splash(context);
          }
        },
      ),
    );
  }

  Widget _splash(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset(AppAssets.logoFPDMT, height: 95.h),
          SizedBox(height: 10.h),
          Text(
            AppString.appName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          SizedBox(height: 150.h),
          SizedBox(
            width: 200.w,
            child: LinearProgressIndicator(
              minHeight: 7.h,
              backgroundColor: AppColors.secondaryPrimaryColor,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 150.h),

          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  void navigateUser(BuildContext context) async {
    var onboardingShown =
        await LocalStorageManager.readData(AppConstants.onboarding);
    bool shouldShowOnboarding = onboardingShown ?? false;

    if (!shouldShowOnboarding) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const OnboardingBoard()),
        (Route<dynamic> route) => false,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SignInScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
