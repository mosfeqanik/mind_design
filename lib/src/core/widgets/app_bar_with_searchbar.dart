import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class AppbarSearchScreen extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget upperWidget;
  final String? searchHintText;

  const AppbarSearchScreen(
      {super.key, required this.upperWidget, this.searchHintText});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primaryColor,
      toolbarHeight: kToolbarHeight * 3,
      title: Column(
        children: [
          upperWidget,
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
