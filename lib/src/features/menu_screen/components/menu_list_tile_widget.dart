import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuListTileWidget extends StatelessWidget {
  final String? leadingAssets;
  final String? titleText;
  final Color? containerColor;
  final VoidCallback? listTileOnTapFunc;
  final String? subTitle;
  final bool? isIconBtnShown;

  const MenuListTileWidget(
      {super.key,
      this.leadingAssets,
      this.containerColor,
      this.subTitle,
      required this.isIconBtnShown,
      required this.listTileOnTapFunc,
      this.titleText});

  @override
  Widget build(BuildContext context) {
    Color textColor = listTileOnTapFunc == null ? Colors.black38 : Colors.black;
    Color iconAndImage =
        listTileOnTapFunc == null ? Colors.black45 : const Color(0xFF82878F);
    return Container(
      alignment: Alignment.center,
      height: 65.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListTile(
        onTap: listTileOnTapFunc ?? () {},
        subtitle:
            (subTitle != null && leadingAssets != null && subTitle!.isNotEmpty)
                ? Text(
                    subTitle!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black),
                  )
                : null,
        leading: (leadingAssets != null && leadingAssets!.isNotEmpty)
            ? Image.asset(
                leadingAssets!,
                height: 20.h,
                width: 20.w,
                color: iconAndImage,
              )
            : null,
        title: (leadingAssets != null && leadingAssets!.isNotEmpty)
            ? Text(
                titleText!,
                style: TextStyle(fontSize: 15.sp, color: textColor),
              )
            : Text(
                titleText!,
                style: TextStyle(fontSize: 15.sp, color: Colors.black45),
              ),
        trailing: (isIconBtnShown != null && isIconBtnShown!)
            ? Icon(
                Icons.arrow_forward_ios,
                color: iconAndImage,
              )
            : null,
      ),
    );
  }
}
