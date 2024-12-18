// import 'package:family_planng_dmt/src/features/dashboard_screen/model/get_distribution_quantity_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
// import '../../features/dashboard_screen/provider/dashboard_provider.dart';
// import '../../utils/app_assets.dart';
//
// class TotalSupplyListWidget extends StatelessWidget {
//   final List<RmgDistributionData>? data;
//   final String? productTitle;
//   final String? productSubTitle;
//   final Color? productdotColor;
//
//   const TotalSupplyListWidget(
//       {super.key,
//       this.data,
//       this.productTitle,
//       this.productSubTitle,
//       this.productdotColor});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DashboardProvider>(builder: (_, dashboardProvider, ___) {
//       if (dashboardProvider.distributionQuantityData != null) {
//         return Container(
//           height: 200.h,
//           color: Colors.white,
//           child: Row(
//             children: [
//               Image.asset(AppAssets.homeScreenStockImage),
//               Expanded(
//                 child: SizedBox(
//                   height: 50.h,
//                   width: double.infinity,
//                   child: GridView.builder(
//                       shrinkWrap: true,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 0,
//                         mainAxisSpacing: 0,
//                         childAspectRatio: 1,
//                       ),
//                       itemCount: dashboardProvider
//                           .distributionQuantityData?.data?.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             Text(
//                               dashboardProvider.distributionQuantityData!
//                                   .data![index].distributeQty
//                                   .toString(),
//                               textAlign: TextAlign.center,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(fontSize: 14.sp),
//                             ),
//                             Text(
//                               dashboardProvider
//                                   .distributionQuantityData!.data![index].bnName
//                                   .toString(),
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black),
//                             ),
//                           ],
//                         );
//                       }),
//                 ),
//               ),
//             ],
//           ),
//         );
//       } else {
//         return Container();
//       }
//     });
//   }
// }
