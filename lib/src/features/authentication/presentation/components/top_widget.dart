import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/themes_styles.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_strings.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: 50.r,
            backgroundColor: const Color(0xFF2F5596),
            child: Image.asset(
              AppAssets.logoFPDMT,
              height: 80.h,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            AppString.accountLogin,
            style: TextThemesStyles.blackHeading,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            AppString.accountLoginInfo,
            style: TextStyle(fontSize: 12.sp, color: Colors.black45),
          ),
        ],
      ),
    );
  }
}
