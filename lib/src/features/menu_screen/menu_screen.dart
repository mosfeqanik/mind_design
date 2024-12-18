import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/border_widget.dart';
import '../../core/widgets/cached_image.dart';
import '../../core/widgets/custom_appbar_widget.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_strings.dart';
import '../authentication/provider/auth_provider.dart';
import '../commodities_entry/commodities_entry_types_point.dart';
import '../dashboard_screen/provider/dashboard_provider.dart';
import '../splash/presentation/splash_page.dart';
import 'Commodity_Receiver_List/commodity_receiver_list.dart';
import 'Emergency_Helpline/emergency_helpline.dart';
import 'components/menu_list_tile_widget.dart';

class MenuScreen extends StatefulWidget {
  final String? orgType;

  const MenuScreen({super.key, this.orgType});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  void _onItemTapped() {
    Provider.of<DashboardProvider>(context, listen: false).setSelectedIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    final available = Provider.of<DashboardProvider>(context);
    return Scaffold(
      appBar: const CustomAppbarWidget(
        autoLeading: false,
        titleText: AppString.menuTxt,
      ),
      body: PopScope(
        canPop: false, // Set to true to allow popping
        onPopInvoked: (didPop) async {
          _onItemTapped();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<AuthProvider>(builder: (context, authProvider, child) {
                if (available.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (available.error != null) {
                  return Center(child: Text('Error: ${available.error}'));
                }
                if (authProvider.userDetail!.representative != null) {
                  final data = authProvider.userDetail!.representative!;
                  return widget.orgType == "ufpo"
                      ? _representativeProfile(
                          data.ufpo!.logo.toString(),
                          data.ufpo!.bnName.toString(),
                          data.ufpo!.addressLine.toString(),
                          context)
                      : _representativeProfile(
                          data.rmg!.logo.toString(),
                          data.rmg!.bnName.toString(),
                          data.rmg!.addressLine.toString(),
                          context);
                }
                return const Center(
                  child: Text('No data available.'),
                );
              }),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.w),
                  ),
                  elevation: 10,
                  shadowColor: Colors.white,
                  child: Column(
                    children: [
                      widget.orgType == "ufpo"
                          ? lotEntryPart(orgType: widget.orgType!)
                          : Container(),
                      const BorderWidget(),
                      MenuListTileWidget(
                        isIconBtnShown: true,
                        subTitle: "",
                        listTileOnTapFunc: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CommodityReceiverList(),
                            ),
                          );
                        },
                        titleText: AppString.cmdiRcvrListTxt,
                        leadingAssets: AppAssets.cmdtReciverList,
                      ),
                      const BorderWidget(),
                      MenuListTileWidget(
                        subTitle: "",
                        isIconBtnShown: true,
                        listTileOnTapFunc: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EmergencyHelpline(),
                            ),
                          );
                        },
                        titleText: AppString.emergencyHelpline,
                        leadingAssets: AppAssets.menuScreenHelplineIcon,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.w)),
                  elevation: 10,
                  shadowColor: Colors.white,
                  child: const Column(
                    children: [
                      MenuListTileWidget(
                        isIconBtnShown: true,
                        subTitle: "",
                        listTileOnTapFunc: null,
                        titleText: AppString.nearMdclCnt,
                        leadingAssets: AppAssets.menuScreenLocationIcon,
                      ),
                      BorderWidget(),
                      MenuListTileWidget(
                        subTitle: "",
                        isIconBtnShown: true,
                        listTileOnTapFunc: null,
                        titleText: AppString.aboutUs,
                        leadingAssets: AppAssets.menuScreenInfoIcon,
                      ),
                      BorderWidget(),
                      MenuListTileWidget(
                        isIconBtnShown: true,
                        subTitle: "",
                        listTileOnTapFunc: null,
                        titleText: AppString.ruleUseApp,
                        leadingAssets: AppAssets.menuScreenRuleIcon,
                      ),
                      BorderWidget(),
                      MenuListTileWidget(
                        isIconBtnShown: true,
                        subTitle: "",
                        listTileOnTapFunc: null,
                        titleText: AppString.menuCondition,
                        leadingAssets: AppAssets.menuScreenConditionIcon,
                      ),
                      BorderWidget(),
                      MenuListTileWidget(
                        isIconBtnShown: true,
                        subTitle: "",
                        listTileOnTapFunc: null,
                        titleText: AppString.presonalCndt,
                        leadingAssets:
                            AppAssets.menuScreenPersonalConditionIcon,
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<AuthProvider>(
                builder: (context, controller, _) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: GestureDetector(
                      onTap: () async {
                        String? msg = await controller.logOut();
                        if (msg == "Successfully Logged Out") {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const SplashPage()),
                            (Route<dynamic> route) => false,
                          );
                        }
                      },
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Image.asset(
                            AppAssets.menuScreenLogoutIcon,
                            height: 20.h,
                            width: 20.w,
                          ),
                          title: Text(
                            AppString.logOut,
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 60.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget lotEntryPart({required String? orgType}) {
    return Column(
      children: [
        MenuListTileWidget(
          isIconBtnShown: true,
          subTitle: "",
          listTileOnTapFunc: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CommoditiesEntryPoint(
                  orgType: orgType,
                ),
              ),
            );
          },
          titleText: AppString.cmdiSupply,
          leadingAssets: AppAssets.menuScreenLightIcon,
        ),
        const BorderWidget(),
        MenuListTileWidget(
          isIconBtnShown: true,
          subTitle: "",
          listTileOnTapFunc: () {},
          titleText: AppString.cmdEntry,
          leadingAssets: AppAssets.menuScreenSunIcon,
        ),
      ],
    );
  }

  Widget _representativeProfile(
      String imageUrl, String bnName, String address, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      height: 90.h,
      width: double.infinity,
      child: Card(
        color: const Color(0xFFFFFFFF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedImage(
              imgUrl: imageUrl,
              height: 55.h,
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bnName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    address,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black45),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const HealthWorkerProfile(),
                //   ),
                // );
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
            )
          ],
        ),
      ),
    );
  }
}
