import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/themes_styles.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_strings.dart';

class LowerPart extends StatelessWidget {
  const LowerPart({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppString.newUser,
                style: TextThemesStyles.blackSubSmall,
              ),
              Text(
                AppString.contactAdmin,
                style: TextThemesStyles.primaryColorSubSmall,
              )
            ],
          ),
        ),
        SizedBox(
          height: 70.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Image.asset(
            AppAssets.powerdByToguMogu,
            height: 30.h,
            width: 340.w,
          ),
        ),
      ],
    );
  }
}
