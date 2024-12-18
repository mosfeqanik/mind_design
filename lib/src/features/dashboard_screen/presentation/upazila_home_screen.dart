import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/app_bar_with_searchbar.dart';
import '../../../core/widgets/app_exit_dialog_widget.dart';
import '../../../core/widgets/entry_widget.dart';
import '../../../core/widgets/total_stock_widget.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../authentication/provider/auth_provider.dart';
import '../../commodities_entry/commodities_entry_types_point.dart';
import '../provider/dashboard_provider.dart';

class UpazilaHomeScreen extends StatefulWidget {
  final String? orgType;

  const UpazilaHomeScreen({super.key, this.orgType});

  @override
  State<UpazilaHomeScreen> createState() => _UpazilaHomeScreenState();
}

class _UpazilaHomeScreenState extends State<UpazilaHomeScreen> {
  List<bool> isSelected = [
    true,
    false,
  ];

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
    final available = Provider.of<DashboardProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppbarSearchScreen(
        searchHintText: AppString.homeAppbarSearchHintText,
        upperWidget: Consumer<AuthProvider>(
          builder: (_, authProvider, ___) {
            return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                // HomeScreenAppBarWidget(
                //   garmentName:
                //       authProvider.userDetail!.representative!.ufpo!.bnName,
                //   address: authProvider
                //       .userDetail!.representative!.ufpo!.addressLine,
                //   imgUrl: authProvider.userDetail!.representative!.ufpo!.logo,
                // ),
              ],
            );
          },
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: AppExitDialog(
        body: body(available, context),
      ),
    );
  }

  Widget body(DashboardProvider available, BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                loadData();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Commodity Supply Part
                    SizedBox(
                      height: 26.h,
                    ),
                    // Commodity Supply And Recive Part
                    _commoditySupplyPart(available, context),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Commodity Supply Part
  Widget _commoditySupplyPart(
      DashboardProvider dashboardProvider, BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EntryWidget(
                onPressedFnc: () {},
                titleText: AppString.procedureRif,
                subTitleText: AppString.userCommodityEntry,
                images: AppAssets.entryReciveIconImge,
                btnText: AppString.refer,
              ),
              EntryWidget(
                onPressedFnc: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CommoditiesEntryPoint()));
                },
                titleText: AppString.procedureSupply,
                subTitleText: AppString.userCommodityEntry,
                images: AppAssets.entrySupplyIconImge,
                btnText: AppString.supply,
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          // Total Stock Part
          TotalStockWidget(
            data: dashboardProvider.availableQuantityData?.data,
          ),
          // Total Supply Part

          SizedBox(
            height: 20.h,
          ),

          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
