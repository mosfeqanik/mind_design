import '/src/features/dashboard_screen/presentation/upazila_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../Statistics_Screen/statistics_screen.dart';
import '../../commodities_entry/commodities_entry_types_point.dart';
import '../../help_screen/help_screen.dart';
import '../../menu_screen/menu_screen.dart';
import '../provider/dashboard_provider.dart';
import 'rmg_home_screen.dart';

class DashBoardScreen extends StatefulWidget {
  final String? orgType;

  const DashBoardScreen({super.key, this.orgType});

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  late List<Widget> _pages;
  String? orgType = "";

  @override
  void initState() {
    super.initState();
    loadData();
    _pages = [
      widget.orgType == "ufpo"
          ? UpazilaHomeScreen(
              orgType: widget.orgType,
            )
          : const RmgHomeScreen(),
      const StatisticsScreen(),
      CommoditiesEntryPoint(
        orgType: widget.orgType,
      ),
      const HelpScreen(),
      MenuScreen(
        orgType: widget.orgType,
      ),
    ];
  }

  void loadData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DashboardProvider>(context, listen: false).loadData();
    });
  }

  void _onItemTapped(int index) {
    Provider.of<DashboardProvider>(context, listen: false)
        .setSelectedIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = Provider.of<DashboardProvider>(context).selectedIndex;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        onPressed: () {
          _onItemTapped(2);
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        child: Image.asset(
          AppAssets.dashboardScanIconImage,
          color: Colors.white,
          height: 20.h,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                color:
                    selectedIndex == 0 ? const Color(0xFF2F5596) : Colors.grey,
                AppAssets.dashboardHomeIconImage,
                width: 20.w,
              ),
              label: AppString.homeTxt,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                color:
                    selectedIndex == 1 ? const Color(0xFF2F5596) : Colors.grey,
                AppAssets.dashboardStaticIconImage,
                width: 20.w,
              ),
              label: AppString.staticTxt,
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 25.w,
                height: 25.h,
              ),
              label: AppString.entryTxt,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                color:
                    selectedIndex == 3 ? const Color(0xFF2F5596) : Colors.grey,
                AppAssets.dashboardHelpIconImage,
                width: 25.w,
              ),
              label: AppString.helpTxt,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                color:
                    selectedIndex == 4 ? const Color(0xFF2F5596) : Colors.grey,
              ),
              label: AppString.menuTxt,
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: const Color(0xFF2F5596),
          unselectedItemColor: Colors.black,
          selectedFontSize: 12.sp,
          showUnselectedLabels: true,
          unselectedFontSize: 12.sp,
          unselectedLabelStyle: const TextStyle(color: Colors.black54),
          selectedLabelStyle: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          elevation: 5),
      body: _pages[selectedIndex],
    );
  }
}
