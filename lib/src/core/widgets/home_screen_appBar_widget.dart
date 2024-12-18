import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cached_image.dart';

class HomeScreenAppBarWidget extends StatelessWidget {
  final String? imgUrl;
  final String? garmentName;
  final String? address;

  const HomeScreenAppBarWidget(
      {super.key, this.imgUrl, this.garmentName, this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
          child: CachedImage(
            height: 35.h,
            imgUrl: imgUrl!,
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                garmentName!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                address!,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
            size: 28.sp,
          ),
        ),
      ],
    );
  }
}
