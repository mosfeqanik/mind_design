import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_room/src/utils/themes_styles.dart';

import '/src/utils/app_colors.dart';

class TextFieldFormWidget extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool isPassObscureText;
  final TextEditingController edtTxtCntr;
  final TextInputType? txtType;
  final FormFieldValidator<String> validatorFunc;

  const TextFieldFormWidget({
    required this.validatorFunc,
    super.key,
    required this.edtTxtCntr,
    this.txtType,
    required this.isPassObscureText,
    this.labelText,
    this.hintText,
  });

  @override
  State<TextFieldFormWidget> createState() => _TextFieldFormWidgetState();
}

class _TextFieldFormWidgetState extends State<TextFieldFormWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final obscureText = widget.isPassObscureText ? !_isPasswordVisible : false;
    return TextFormField(
      style: AppTextStyle.appTextStyle.copyWith(color: AppColors.hintTextColor),
      validator: widget.validatorFunc,
      obscureText: obscureText,
      controller: widget.edtTxtCntr,
      keyboardType: widget.txtType ?? TextInputType.text,
      decoration: InputDecoration(
          suffixIcon: widget.isPassObscureText == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off))
              : null,
          hintStyle: AppTextStyle.appTextStyle
              .copyWith(color: AppColors.hintTextColor),
          labelStyle: AppTextStyle.appTextStyle
              .copyWith(color: AppColors.hintTextColor),
          hintText: widget.hintText ?? widget.labelText,
          labelText: widget.labelText,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.dividerColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.dividerColor,
              ))),
    );
  }
}
