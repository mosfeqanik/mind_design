import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/core/widgets/border_widget.dart';
import '/src/core/widgets/container_button_widget.dart';
import '/src/core/widgets/custom_appbar_widget.dart';
import '/src/core/widgets/list_tile_widget.dart';
import '/src/utils/app_strings.dart';
import '../../../utils/app_colors.dart';

class EmergencyHelpline extends StatefulWidget {
  final String? btncTxt;

  const EmergencyHelpline({
    super.key,
    this.btncTxt,
  });

  @override
  State<EmergencyHelpline> createState() => _EmergencyHelplineState();
}

class _EmergencyHelplineState extends State<EmergencyHelpline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarWidget(
        autoLeading: true,
        titleText: AppString.emergencyHelpline,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.w),
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.w)),
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                children: [
                  ListTileWidget(
                    containerBtnWidget: ContainerButtonWidget(
                      btnColor: AppColors.yellowColor,
                      textBtn: AppString.callbtnTxt,
                      isIconBtnShown: true,
                      btnFunc: () {},
                    ),
                    imgPath: "",
                    listTileTitle: AppString.nearMdclCnt,
                    listTileSubTitle: "+৮৮ ০১৭৩৬১২০৯৮২",
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const BorderWidget(),
                  SizedBox(
                    height: 5.h,
                  ),
                  ListTileWidget(
                    containerBtnWidget: ContainerButtonWidget(
                      textBtn: AppString.callbtnTxt,
                      btnColor: AppColors.redColor,
                      isIconBtnShown: true,
                      btnFunc: () {},
                    ),
                    imgPath: "",
                    listTileTitle: AppString.tecnicalHelpLine,
                    listTileSubTitle: "+৮৮ ০১৬৩৬৬৮২০৯৮",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
