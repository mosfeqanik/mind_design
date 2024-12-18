import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../features/dashboard_screen/model/get_available_quantity_model.dart';
import '../../features/dashboard_screen/provider/dashboard_provider.dart';
import '../../utils/app_strings.dart';
import 'cached_image.dart';

class TotalStockWidget extends StatelessWidget {
  final List<RmgAvailableData>? data;
  const TotalStockWidget({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.totalStock,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF000000)),
          ),
          SizedBox(
            height: 8.h,
          ),
          Consumer<DashboardProvider>(builder: (_, dashboardProvider, ___) {
            if (dashboardProvider.availableQuantityData != null) {
              var dataList =
                  dashboardProvider.availableQuantityData!.data ?? [];
              var filteredDataList = dataList
                  .where((data) => double.parse(data.availableQty ?? "0") > 0)
                  .toList();
              return Container(
                  color: const Color(0xFFFDF8F8),
                  height: MediaQuery.of(context).size.height / 2.h,
                  width: double.infinity,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dataList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 12.h,
                          crossAxisSpacing: 12.w),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 140.h,
                          width: 110.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 42.h,
                                  width: 42.w,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100.w),
                                      color: const Color.fromARGB(
                                          31, 125, 120, 120)),
                                  child: CachedImage(
                                    height: 20.h,
                                    imgUrl: dataList[index].image ?? "",
                                  )),
                              Text(
                                dataList[index].bnName!,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              Text(
                                dataList[index].availableQty!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }));
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
