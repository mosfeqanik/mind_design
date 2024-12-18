import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/commodities_entry_widget.dart';
import '../../core/widgets/custom_appbar_widget.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import 'entry_with_id/entry_with_id.dart';
import 'entry_with_mobile_number/presentation/mobile_number_entry_screen.dart';
import 'new_entry/new_entry.dart';

class CommoditiesEntryPoint extends StatelessWidget {
  final String? orgType;
  const CommoditiesEntryPoint({super.key, this.orgType});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const CustomAppbarWidget(
        autoLeading: true,
        titleText: AppString.cmdTitle,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            CommoditiesEntryWidget(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              subtitleStyle: TextStyle(
                color: AppColors.textColor,
              ),
              tileLeadingImage: AppAssets.personIconLogo,
              personLeadingImage: true,
              tileTitle: AppString.mobileNumber,
              subTileTitle: AppString.workerMobileNmbr,
              trailingFunc: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MobileNumberEntryScreen(
                      orgType: orgType,
                    ),
                  ),
                );
              },
            ),
            CommoditiesEntryWidget(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              subtitleStyle: TextStyle(
                color: AppColors.textColor,
              ),
              tileLeadingImage: AppAssets.iDCardIconImage,
              tileTitle: AppString.idTxt,
              subTileTitle: AppString.workerIdEntry,
              personLeadingImage: true,
              trailingFunc: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserIdEntryScreen(),
                  ),
                );
              },
            ),
            CommoditiesEntryWidget(
              titleStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              subtitleStyle: TextStyle(
                color: AppColors.textColor,
              ),
              tileLeadingImage: AppAssets.dashboardScanIconImage,
              personLeadingImage: true,
              tileTitle: AppString.scanTxt,
              subTileTitle: AppString.workerScanEntry,
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
              tileLeadingImage: AppAssets.newEntryPersonIconImage,
              tileTitle: AppString.newEntryTxt,
              personLeadingImage: true,
              subTileTitle: AppString.newWorkeradd,
              trailingFunc: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewUserEntry(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
