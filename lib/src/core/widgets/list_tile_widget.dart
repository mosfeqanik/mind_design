import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileWidget extends StatelessWidget {
  final String? listTileTitle;
  final String? listTileSubTitle;
  final String? imgPath;
  final Color? cardBGColor;
  final Color? textColor;
  final bool? isBgWhite;
  final Widget containerBtnWidget;

  const ListTileWidget(
      {super.key,
      this.imgPath,
      this.listTileSubTitle,
      this.listTileTitle,
      required this.containerBtnWidget,
      this.cardBGColor,
      this.textColor,
      this.isBgWhite});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: cardBGColor ?? Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (imgPath != null && imgPath!.isNotEmpty)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 45.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.w),
                      color: isBgWhite != null
                          ? Colors.white
                          : const Color.fromARGB(31, 125, 120, 120)),
                  padding: EdgeInsets.all(6.w),
                  child: Image.asset(imgPath!),
                ),
              Center(
                child: Text(
                  listTileTitle!,
                  style: TextStyle(fontSize: 13.sp, color: textColor),
                ),
              ),
            ],
          ),
          containerBtnWidget,
        ],
      ),
    );
  }
}
