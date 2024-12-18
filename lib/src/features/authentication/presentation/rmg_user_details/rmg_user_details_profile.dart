import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/border_widget.dart';
import '../../../../utils/app_strings.dart';
import '../../../commodities_entry/provider/commodities_provider.dart';
import '../../../menu_screen/components/menu_list_tile_widget.dart';

class RMGUserDetailsProfile extends StatelessWidget {
  const RMGUserDetailsProfile({
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
                    subTitle: ctrl.rmgDetailData.rmg?.mobile,
                    leadingAssets: "",
                    titleText: AppString.mobileNumber,
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: ctrl.rmgDetailData.rmg?.email ?? "no data",
                    leadingAssets: "",
                    titleText: "ই-মেইল",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: ctrl.rmgDetailData.rmg?.hrContact,
                    leadingAssets: "",
                    titleText: "এইচআর মোবাইল",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: ctrl.rmgDetailData.rmg?.status,
                    leadingAssets: "",
                    titleText: "অবস্থা",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: "${ctrl.rmgDetailData.rmg?.totalWorker}",
                    leadingAssets: "",
                    titleText: "মোট কর্মী",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: "${ctrl.rmgDetailData.rmg?.totalMale}",
                    leadingAssets: "",
                    titleText: "মোট পুরুষ কর্মী",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: "${ctrl.rmgDetailData.rmg?.totalFemale}",
                    leadingAssets: "",
                    titleText: "মোট মহিলা কর্মী",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: "${ctrl.rmgDetailData.rmg?.areaId}",
                    leadingAssets: "",
                    titleText: "এলাকা আইডি",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: ctrl.rmgDetailData.rmg?.addressLine,
                    leadingAssets: "",
                    titleText: "ঠিকানা",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: "${ctrl.rmgDetailData.rmg?.districtId}",
                    leadingAssets: "",
                    titleText: "জেলা আইডি",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: ctrl.rmgDetailData.rmg?.district ?? "no data",
                    leadingAssets: "",
                    titleText: "জেলা",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: "${ctrl.rmgDetailData.rmg?.divisionId}",
                    leadingAssets: "",
                    titleText: "বিভাগ আইডি",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: ctrl.rmgDetailData.rmg?.division ?? "no data",
                    leadingAssets: "",
                    titleText: "বিভাগ",
                  ),
                  const BorderWidget(),
                  MenuListTileWidget(
                    isIconBtnShown: false,
                    listTileOnTapFunc: () {},
                    subTitle: ctrl.rmgDetailData.rmg?.country,
                    leadingAssets: "",
                    titleText: "দেশ",
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
