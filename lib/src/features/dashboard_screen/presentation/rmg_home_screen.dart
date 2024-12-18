import '/src/core/widgets/app_exit_dialog_widget.dart';
import '/src/core/widgets/entry_widget.dart';
import '/src/core/widgets/home_screen_appBar_widget.dart';
import '/src/core/widgets/today_supply_listTile_widget.dart';
import '/src/core/widgets/total_stock_widget.dart';
import '/src/features/commodities_entry/commodities_entry_types_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/app_bar_with_searchbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../authentication/provider/auth_provider.dart';
import '../provider/dashboard_provider.dart';

class RmgHomeScreen extends StatefulWidget {
  const RmgHomeScreen({
    super.key,
  });

  @override
  State<RmgHomeScreen> createState() => _RmgHomeScreenState();
}

class _RmgHomeScreenState extends State<RmgHomeScreen> {
  List<bool> isSelected = [
    true,
    false,
  ];
  String? orgType = "";

  void loadData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DashboardProvider>(context, listen: false).loadData();
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    orgType =
        Provider.of<AuthProvider>(context).userDetail?.representative!.orgType;
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppbarSearchScreen(
          searchHintText: AppString.homeAppbarSearchHintText,
          upperWidget: Consumer<AuthProvider>(
            builder: (_, authProvider, ___) {
              return Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  HomeScreenAppBarWidget(
                    garmentName:
                        authProvider.userDetail?.representative?.rmg?.bnName,
                    address: authProvider
                        .userDetail?.representative?.rmg?.addressLine,
                    imgUrl: authProvider.userDetail?.representative?.rmg?.logo,
                  ),
                ],
              );
            },
          ),
        ),
        body: AppExitDialog(
          body: _body(context, orgType!),
        ));
  }

  Widget _body(BuildContext context, String orgType) {
    return RefreshIndicator(
      onRefresh: () async {
        loadData();
      },
      child: SingleChildScrollView(
        child:
            Consumer<DashboardProvider>(builder: (_, dashboardProvider, ___) {
          if (dashboardProvider.availableQuantityData != null) {
            return Column(
              children: [
                SizedBox(
                  height: 26.h,
                ),
                // CommodityEntry Part
                _commodityEntry(dashboardProvider, context, orgType),
              ],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }

  Widget _commodityEntry(DashboardProvider dashboardProvider,
      BuildContext context, String orgType) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xFFFDF8F8),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EntryWidget(
                onPressedFnc: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CommoditiesEntryPoint()));
                },
                titleText: AppString.procedureSupply,
                subTitleText: AppString.userCommodityEntry,
                images: AppAssets.entryIconImge,
                btnText: AppString.supply,
              ),
              EntryWidget(
                onPressedFnc: () {},
                titleText: AppString.procedureRif,
                subTitleText: AppString.userCommodityEntry,
                images: AppAssets.entryIconImge,
                btnText: AppString.refer,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          // Total Stock Part
          TotalStockWidget(
            data: dashboardProvider.availableQuantityData?.data,
          ),
          // Total Supply Part
          // const TotalSupplyWidget(),
          SizedBox(
            height: 20.h,
          ),
          // Today Supply List
          const TodaySupplyListWidget(
            isMainTitle: true,
          ),
          const TodaySupplyListWidget(
            isMainTitle: false,
          ),
          SizedBox(
            height: 70.h,
          ),
        ],
      ),
    );
  }
}
