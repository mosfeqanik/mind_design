import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerButtonWidget extends StatelessWidget {
  final String? textBtn;
  final bool? isIconBtnShown;
  final bool? isTextBtnWhite;
  final Color? btnColor;
  final VoidCallback btnFunc;

  const ContainerButtonWidget(
      {super.key,
      this.textBtn,
      this.isIconBtnShown,
      this.btnColor,
      required this.btnFunc,
      this.isTextBtnWhite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnFunc,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        height: 30.r,
        padding: const EdgeInsets.symmetric(horizontal: 3),
        width: isIconBtnShown != false ? 100.r : 76.r,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (isIconBtnShown != null && isIconBtnShown!)
              const Icon(
                Icons.call,
                color: Colors.white,
                size: 20,
              ),
            Text(
              textBtn!,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isTextBtnWhite != null ? Colors.black : Colors.white,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
