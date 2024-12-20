import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class AppExitDialog extends StatelessWidget {
  final Widget body;
  const AppExitDialog({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Set to true to allow popping
      onPopInvoked: (didPop) async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "AppString.warningTxt",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
              ),
            ),
            content: Text(
              "AppString.alertText",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  "না",
                  style: TextStyle(color: AppColors.bgColor),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  "হ্যাঁ",
                  style: TextStyle(color: AppColors.bgColor),
                ),
              ),
            ],
          ),
        );
        if (value == true) {
          SystemNavigator.pop(); // This will close the app
        }
      },
      child: body,
    );
  }
}
