import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsEntryWidget extends StatelessWidget {
  final String? productAsssets;
  final String? productTitle;
  final String? productSubTitle;

  const ProductsEntryWidget({
    super.key,
    this.productAsssets,
    this.productSubTitle,
    this.productTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 175.w,
      child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.w),
                    color: const Color.fromARGB(31, 125, 120, 120)),
                child: (productAsssets != null && productAsssets!.isNotEmpty)
                    ? Image.asset(productAsssets!)
                    : null,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productTitle!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  Text(productSubTitle!),
                ],
              )
            ],
          )),
    );
  }
}
