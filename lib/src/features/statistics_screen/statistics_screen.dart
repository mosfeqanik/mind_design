import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_appbar_widget.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../dashboard_screen/provider/dashboard_provider.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  List<bool> isSelected = [
    true,
    false,
  ];

  void _onItemTapped() {
    Provider.of<DashboardProvider>(context, listen: false).setSelectedIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbarWidget(
          autoLeading: false,
          titleText: AppString.staticTxt,
        ),
        body: PopScope(
          canPop: false, // Set to true to allow popping
          onPopInvoked: (didPop) async {
            _onItemTapped();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                statisticsHeadingWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Card(
                    child: Image.asset("assets/fpimages/Group 1129.png"),
                  ),
                ),
                statisticsHeadingWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Card(
                    child: Image.asset("assets/fpimages/Group 1127.png"),
                  ),
                ),
                statisticsHeadingWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Card(
                    child: Image.asset("assets/fpimages/Group 1128.png"),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ));
  }

  Widget statisticsHeadingWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        height: 55.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.w)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppString.totalSply,
                  style: TextStyle(fontSize: 20.sp, color: Colors.black)),
              ToggleButtons(
                  isSelected: isSelected,
                  selectedColor: Colors.white,
                  color: Colors.black87,
                  fillColor: AppColors.primaryColor,
                  renderBorder: true,
                  borderColor: Colors.grey,
                  borderRadius: BorderRadius.circular(10.w),
                  children: [
                    Text(AppString.splyMonth,
                        style: TextStyle(fontSize: 15.sp)),
                    Text(AppString.splyYear, style: TextStyle(fontSize: 15.sp)),
                  ],
                  onPressed: (int newIndex) {
                    setState(() {
                      for (int index = 0; index < isSelected.length; index++) {
                        if (index == newIndex) {
                          isSelected[index] = !isSelected[index];
                        } else {
                          isSelected[index] = false;
                        }
                      }
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
