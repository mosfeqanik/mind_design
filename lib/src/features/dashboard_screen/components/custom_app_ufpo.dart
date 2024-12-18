import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/cached_image.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_strings.dart';

class CustomApp extends StatelessWidget {
  final String? imgUrl;
  final String? title;
  final String? address;

  const CustomApp({
    super.key,
    this.imgUrl,
    this.title,
    this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 124.h,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          AppAssets.garmentHomeScreenAppBarBg,
        ))),
        child: Column(
          children: [
            SizedBox(
              height: 12.r,
            ),
            Expanded(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: 55.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: CachedImage(
                        height: 40.h,
                        imgUrl: imgUrl,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        address!,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 28,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 24.r,
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Material(
                  borderRadius: BorderRadius.circular(30.w),
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.w),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.w)),
                        hintText: AppString.homeAppbarSearchHintText,
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
