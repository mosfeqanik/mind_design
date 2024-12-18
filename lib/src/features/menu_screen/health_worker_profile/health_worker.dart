import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../authentication/presentation/rmg_user_details/rmg_user_details_widget/rmg_user_details_widget.dart';
import '../components/menu_list_tile_widget.dart';
import '/src/core/widgets/border_widget.dart';
import '/src/core/widgets/custom_appbar_widget.dart';
import '/src/utils/app_assets.dart';
import '/src/utils/app_strings.dart';

class HealthWorkerProfile extends StatefulWidget {
  const HealthWorkerProfile({super.key});

  @override
  State<HealthWorkerProfile> createState() => _HealthWorkerProfileState();
}

class _HealthWorkerProfileState extends State<HealthWorkerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarWidget(
        autoLeading: true,
        titleText: AppString.hlthWkrApBTitle,
      ),
      body: Column(
        children: [
          RmgDetailWidget(
            userName: AppString.amanMdclCentre,
            userId: AppString.savarDhaka,
            userPicture: AppAssets.userHealthWker,
            detailBtnFunc: () {},
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.h),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.w)),
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                MenuListTileWidget(
                  listTileOnTapFunc: () {},
                  leadingAssets: "",
                  isIconBtnShown: false,
                  titleText: AppString.upazilaTxt,
                  subTitle: AppString.upzlHlthComx,
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  listTileOnTapFunc: () {},
                  leadingAssets: "",
                  isIconBtnShown: false,
                  titleText: AppString.workerNmbr,
                  subTitle: "২৬৭৮",
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  listTileOnTapFunc: () {},
                  leadingAssets: "",
                  isIconBtnShown: false,
                  titleText: AppString.manWorker,
                  subTitle: "১৪২০",
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  listTileOnTapFunc: () {},
                  leadingAssets: "",
                  isIconBtnShown: false,
                  titleText: AppString.womanWorker,
                  subTitle: "১২০৮",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
