import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_appbar_widget.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../commodities_entry/provider/commodities_provider.dart';

class RMGDetailScreen extends StatelessWidget {
  const RMGDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const CustomAppbarWidget(
        autoLeading: true,
        titleText: AppString.cmdiWorkerDtls,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.h),
          child: Consumer<CommoditiesServiceProvider>(
              builder: (context, ctrl, child) {
            return !ctrl.isLoading
                ? Column(
                    children: [
                      // RmgDetailWidget(
                      //   userId:
                      //       "ব্যবহারকারীর আইডি:  ${ctrl.rmgDetailData.rmg?.id} ",
                      //   userName: ctrl.rmgDetailData.rmg?.bnName,
                      //   userPicture: ctrl.rmgDetailData.rmg?.logo,
                      //   isDetailBtnShown: true,
                      //   detailBtnFunc: ctrl.toggleBool,
                      // ),
                      SizedBox(
                        height: 15.h,
                      ),
                      // ctrl.isToggled
                      //     ? const RMGCommoditiesColumn()
                      //     : const RMGUserDetailsProfile(),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
        ),
      ),
    );
  }
}
