import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_strings.dart';

class TodaySupplyListWidget extends StatelessWidget {
  final bool isMainTitle;
  const TodaySupplyListWidget({
    super.key,
    required this.isMainTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          isMainTitle == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.todaySupplyList,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF000000)),
                    ),
                    Text(
                      AppString.seeAll,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF000000)),
                    ),
                  ],
                )
              : Container(),
          SizedBox(
            height: 8.h,
          ),
          Container(
            alignment: Alignment.center,
            height: 70.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: ListTile(
              leading: Container(
                alignment: Alignment.center,
                height: 42.h,
                width: 42.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.w),
                    color: const Color(0xFFD9D9D9)),
                child: (Image.asset(AppAssets.userPic)),
              ),
              title: Text(
                "জাহানারা বেগম পারিসা",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "আইডি নম্বর : ১১২৪",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF9B8C8C),
                    fontWeight: FontWeight.w400),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "তারিখঃ ১২/২/২৪",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF9B8C8C),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "আইটেমঃ ২",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF9B8C8C),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
