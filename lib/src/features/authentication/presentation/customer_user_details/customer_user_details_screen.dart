import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_appbar_widget.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../commodities_entry/provider/commodities_provider.dart';
import 'customer_user_details_profile.dart';
import 'customer_user_details_widget/customer_user_commodities_column.dart';
import 'customer_user_details_widget/customer_user_details_widget.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});
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
                      CustomerDetailWidget(
                        userId:
                            "ব্যবহারকারীর আইডি:  ${ctrl.customerDetailData.customer?.id} ",
                        userName: ctrl.customerDetailData.customer?.name,
                        userPicture: ctrl.customerDetailData.customer!.avatar,
                        isDetailBtnShown: true,
                        detailBtnFunc: ctrl.toggleBool,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ctrl.isToggled
                          ? const CustomerCommoditiesColumn()
                          : const CustomerUserDetailsProfile(),
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