import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class BtnWidget extends StatelessWidget {
  final String? btnTitle;
  final VoidCallback btnFunc;

  const BtnWidget({
    super.key,
    this.btnTitle,
    required this.btnFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 50.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.w)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.w), // <-- Radius
            ),
          ),
          onPressed: btnFunc,
          child: Text(
            btnTitle!,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
