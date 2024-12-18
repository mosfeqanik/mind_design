import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsStockWidget extends StatelessWidget {
  final String? productTitle;
  final String? productSubTitle;
  final Color? productdotColor;

  const ProductsStockWidget({
    super.key,
    this.productdotColor,
    this.productSubTitle,
    this.productTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 110.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.w),
                    color: productdotColor),
              ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                width: 50,
                child: Text(
                  productTitle!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
            ],
          ),
          Text(
            productSubTitle!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
