import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/border_widget.dart';
import '../../../../utils/app_strings.dart';
import '../../../commodities_entry/provider/commodities_provider.dart';
import '../../../menu_screen/components/menu_list_tile_widget.dart';

class CustomerUserDetailsProfile extends StatelessWidget {
  const CustomerUserDetailsProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CommoditiesServiceProvider>(
        builder: (context, ctrl, child) {
      return !ctrl.isLoading
          ? Column(
              children: [
                MenuListTileWidget(
                  isIconBtnShown: false,
                  listTileOnTapFunc: () {},
                  subTitle: ctrl.customerDetailData.customer?.employeeNo,
                  leadingAssets: "",
                  titleText: "কর্মচারী_নং",
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  isIconBtnShown: false,
                  listTileOnTapFunc: () {},
                  subTitle: ctrl.customerDetailData.customer?.mobile,
                  leadingAssets: "",
                  titleText: AppString.mobileNumber,
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  isIconBtnShown: false,
                  listTileOnTapFunc: () {},
                  subTitle: "${ctrl.customerDetailData.customer?.createdAt}" ??
                      "no data",
                  leadingAssets: "",
                  titleText: "অ্যাকাউন্ট তৈরির সময়",
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  isIconBtnShown: false,
                  listTileOnTapFunc: () {},
                  subTitle: ctrl.customerDetailData.customer?.email ?? "    _",
                  leadingAssets: "",
                  titleText: "ই-মেইল",
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  isIconBtnShown: false,
                  listTileOnTapFunc: () {},
                  subTitle: ctrl.customerDetailData.customer?.maritalStatus,
                  leadingAssets: "",
                  titleText: AppString.maritialStatus,
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  isIconBtnShown: false,
                  listTileOnTapFunc: () {},
                  subTitle:
                      ctrl.customerDetailData.customer?.position ?? "no data",
                  leadingAssets: "",
                  titleText: "অবস্থান",
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  isIconBtnShown: false,
                  listTileOnTapFunc: () {},
                  subTitle:
                      ctrl.customerDetailData.customer?.profession ?? "no data",
                  leadingAssets: "",
                  titleText: "পেশা",
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  isIconBtnShown: false,
                  listTileOnTapFunc: () {},
                  subTitle:
                      ctrl.customerDetailData.customer?.religion ?? "no data",
                  leadingAssets: "",
                  titleText: "ধর্ম",
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  isIconBtnShown: false,
                  listTileOnTapFunc: () {},
                  subTitle:
                      "${ctrl.customerDetailData.customer?.totalChildren}",
                  leadingAssets: "",
                  titleText: AppString.childrenNmbr,
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  isIconBtnShown: false,
                  listTileOnTapFunc: () {},
                  subTitle: ctrl.customerDetailData.customer?.rmg?.name,
                  leadingAssets: "",
                  titleText: "কর্মীর কর্মক্ষেত্র",
                ),
                const BorderWidget(),
                MenuListTileWidget(
                  isIconBtnShown: false,
                  listTileOnTapFunc: () {},
                  subTitle: ctrl.customerDetailData.customer?.rmg?.hrContact,
                  leadingAssets: "",
                  titleText: "কোম্পানির এইচআর মোবাইল",
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
