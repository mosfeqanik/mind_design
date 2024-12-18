import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../../../../core/widgets/commodities_entry_widget.dart";
import "../../../../../utils/app_colors.dart";
import "../../../../commodities_entry/commodities_entry_form/commodities_entry_customer_form.dart";
import "../../../../commodities_entry/provider/commodities_provider.dart";

class CustomerCommoditiesColumn extends StatelessWidget {
  const CustomerCommoditiesColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CommoditiesServiceProvider>(
        builder: (context, commoditiesProvider, child) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount:
            commoditiesProvider.customerDetailData.customer?.products?.length,
        itemBuilder: (context, index) {
          var product =
              commoditiesProvider.customerDetailData.customer?.products;
          return CommoditiesEntryWidget(
            titleStyle: TextStyle(
              color: AppColors.textColor,
            ),
            subtitleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            subTile2ndTitle: commoditiesProvider.customerDetailData.customer
                ?.products![index].lastDistributionDate,
            subTile3rdTitle: commoditiesProvider
                .customerDetailData.customer?.products![index].nextRefillDate,
            tileTitle: commoditiesProvider
                .customerDetailData.customer?.products![index].bnName,
            subTileTitle: commoditiesProvider
                .customerDetailData.customer?.products![index].takenQty,
            tileLeadingImage: commoditiesProvider
                .customerDetailData.customer?.products![index].image,
            trailingFunc: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommoditiesEntryCustomerForm(
                    customerProductData: commoditiesProvider
                        .customerDetailData.customer?.products![index],
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
