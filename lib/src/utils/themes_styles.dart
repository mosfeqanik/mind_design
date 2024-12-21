import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static final TextStyle appTextStyle = GoogleFonts.poppins();

  static final TextStyle allMainTitleTextStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
      fontSize: 24.sp);

  static final TextStyle allMainSubTitleTextStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: AppColors.secondaryTextColor,
      fontSize: 14.sp);

  static final TextStyle normalTextStyle = GoogleFonts.poppins(fontSize: 14.sp);

  static final TextStyle smallTextStyle = GoogleFonts.poppins(
      fontSize: 10.sp,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w300);

  static final TextStyle blackHeading =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold);
}
