import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../../../../core/widgets/commodities_entry_widget.dart";
import "../../../../../utils/app_colors.dart";
import "../../../../commodities_entry/commodities_entry_form/commodities_entry_rmg_form.dart";
import "../../../../commodities_entry/provider/commodities_provider.dart";

class RMGCommoditiesColumn extends StatelessWidget {
  const RMGCommoditiesColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CommoditiesServiceProvider>(
        builder: (context, commoditiesProvider, child) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: commoditiesProvider.rmgDetailData.rmg?.products?.length,
        // products?.length,
        itemBuilder: (context, index) {
          var product = commoditiesProvider.rmgDetailData.rmg?.products;
          return CommoditiesEntryWidget(
            titleStyle: TextStyle(
              color: AppColors.textColor,
            ),
            subtitleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            tileTitle:
                commoditiesProvider.rmgDetailData.rmg?.products![index].bnName,
            subTileTitle: commoditiesProvider
                .rmgDetailData.rmg?.products![index].takenQty,
            tileLeadingImage:
                commoditiesProvider.rmgDetailData.rmg?.products![index].image,
            trailingFunc: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommoditiesEntryRmgForm(
                    rmgProductData:
                        commoditiesProvider.rmgDetailData.rmg?.products![index],
                  ),
                ),
              );
            },
          );
        },
      );
    });
  }
}
