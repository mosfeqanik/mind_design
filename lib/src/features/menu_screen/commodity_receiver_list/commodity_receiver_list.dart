import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/app_bar_with_searchbar.dart';
import '../../../utils/app_colors.dart';
import '/src/core/widgets/commodities_entry_widget.dart';
import '/src/utils/app_assets.dart';
import '/src/utils/app_strings.dart';

class CommodityReceiverList extends StatefulWidget {
  const CommodityReceiverList({super.key});

  @override
  State<CommodityReceiverList> createState() => _CommodityReceiverListState();
}

class _CommodityReceiverListState extends State<CommodityReceiverList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSearchScreen(
        searchHintText: AppString.searchBarText,
        upperWidget: upperWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(AppString.presentList),
                  Container(
                    width: 110.w,
                    height: 50.h,
                    decoration: const BoxDecoration(color: Colors.white),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(AppString.filterTxt),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_list_rounded,
                            color: Colors.black45,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            CommoditiesEntryWidget(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              subtitleStyle: TextStyle(
                color: AppColors.textColor,
              ),
              tileLeadingImage: AppAssets.userPic,
              tileTitle: "জাহানারা বেগম পারিসা",
              subTileTitle: "আইডি নম্বর : ১১২৪",
              trailingFunc: () {},
            ),
            CommoditiesEntryWidget(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              subtitleStyle: TextStyle(
                color: AppColors.textColor,
              ),
              tileLeadingImage: "assets/fpimages/Ellipse 584.png",
              tileTitle: "রাশিদা বেগম ",
              subTileTitle: "আইডি নম্বর : ১৭৮০",
              trailingFunc: () {},
            ),
            CommoditiesEntryWidget(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              subtitleStyle: TextStyle(
                color: AppColors.textColor,
              ),
              tileLeadingImage: "assets/fpimages/Ellipse 584 (1).png",
              tileTitle: "মোহাম্মাদ সুলতান মিয়া ",
              subTileTitle: "আইডি নম্বর : ১৭৮৫",
              trailingFunc: () {},
            ),
            CommoditiesEntryWidget(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              subtitleStyle: TextStyle(
                color: AppColors.textColor,
              ),
              tileLeadingImage: "assets/fpimages/Ellipse 584 (2).png",
              tileTitle: "জামিল হোসাইন ",
              subTileTitle: "আইডি নম্বর : ১৭৮৮",
              trailingFunc: () {},
            ),
            CommoditiesEntryWidget(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              subtitleStyle: TextStyle(
                color: AppColors.textColor,
              ),
              tileLeadingImage: "assets/fpimages/Ellipse 584 (3).png",
              tileTitle: "নাজমা বেগম ",
              subTileTitle: "আইডি নম্বর : ১৭৮৯",
              trailingFunc: () {},
            ),
            CommoditiesEntryWidget(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              subtitleStyle: TextStyle(
                color: AppColors.textColor,
              ),
              tileLeadingImage: "assets/fpimages/Ellipse 584 (4).png",
              tileTitle: "মকবুল হোসাইন ",
              subTileTitle: "আইডি নম্বর : ১৮০২",
              trailingFunc: () {},
            ),
            CommoditiesEntryWidget(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              subtitleStyle: TextStyle(
                color: AppColors.textColor,
              ),
              tileLeadingImage: "assets/fpimages/Ellipse 584 (5).png",
              tileTitle: "মোস্তফা সরকার ইমন ",
              subTileTitle: "আইডি নম্বর :১৮০৪",
              trailingFunc: () {},
            ),
            CommoditiesEntryWidget(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              subtitleStyle: TextStyle(
                color: AppColors.textColor,
              ),
              tileLeadingImage: "assets/fpimages/Ellipse 584 (6).png",
              tileTitle: "জয়নব বিবি সরকার ",
              subTileTitle: "আইডি নম্বর :১৮০৫",
              trailingFunc: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget upperWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 7.w,
        ),
        const Text(
          AppString.cmdiRcvrListTxt,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
