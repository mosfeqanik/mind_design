import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/common_function.dart';
import 'cached_image.dart';

class CommoditiesEntryWidget extends StatelessWidget {
  final String? tileLeadingImage;
  final bool? personLeadingImage;
  final String? tileTitle;
  final String? subTileTitle;
  final DateTime? subTile2ndTitle;
  final DateTime? subTile3rdTitle;
  final dynamic titleStyle;
  final dynamic subtitleStyle;
  final VoidCallback trailingFunc;

  const CommoditiesEntryWidget({
    super.key,
    this.tileLeadingImage,
    this.tileTitle,
    this.subTileTitle,
    required this.trailingFunc,
    required this.titleStyle,
    required this.subtitleStyle,
    this.personLeadingImage,
    this.subTile2ndTitle,
    this.subTile3rdTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(color: Colors.transparent),
      ),
      child: ListTile(
        onTap: trailingFunc,
        leading: Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.containerBgColor,
          ),
          child: Center(
            child: CachedImage(
              imgUrl: tileLeadingImage ?? "",
              height: personLeadingImage != null ? 25.h : 45.h,
            ),
          ),
        ),
        title: Text(tileTitle!, style: titleStyle),
        subtitle: subTileTitle != ""
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subTileTitle!, style: subtitleStyle),
                  subTile2ndTitle != null
                      ? Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.skyblueColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                              "Last Received: ${CommonFunction.dateFormatterFuncDate(inputString: subTile2ndTitle.toString())}",
                              style: subtitleStyle),
                        )
                      : Container(),
                  subTile3rdTitle != null
                      ? Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.redpinkColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                              "Next Refill: ${CommonFunction.dateFormatterFuncDate(inputString: subTile3rdTitle.toString())}",
                              style: subtitleStyle),
                        )
                      : Container(),
                ],
              )
            : null,
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.textColor,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
      ),
    );
  }
}
