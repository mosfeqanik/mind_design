import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? titleText;
  final bool autoLeading;
  const CustomAppbarWidget({
    super.key,
    this.titleText,
    required this.autoLeading,
  });
  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: autoLeading,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        titleText!,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
