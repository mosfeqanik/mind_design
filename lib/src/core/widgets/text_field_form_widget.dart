import '/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../features/authentication/provider/auth_provider.dart';

class TextFieldFormWidget extends StatefulWidget {
  final String? labelText;
  final double? boxHeight;
  final double? boxWidth;
  final bool? isSuffixIconOn;
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
    this.isSuffixIconOn,
    this.boxHeight,
    this.boxWidth,
  });

  @override
  State<TextFieldFormWidget> createState() => _TextFieldFormWidgetState();
}

class _TextFieldFormWidgetState extends State<TextFieldFormWidget> {
  @override
  Widget build(BuildContext context) {
    final passwordVisibilityProvider = Provider.of<AuthProvider>(context);

    final obscureText = widget.isPassObscureText
        ? passwordVisibilityProvider.isPasswordVisibility
        : false;
    return TextFormField(
      validator: widget.validatorFunc,
      obscureText: obscureText,
      controller: widget.edtTxtCntr,
      keyboardType: widget.txtType ?? TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: widget.isSuffixIconOn == true
            ? IconButton(
                onPressed: passwordVisibilityProvider.togglePasswordVisibility,
                icon: Icon(passwordVisibilityProvider.isPasswordVisibility
                    ? Icons.visibility_off
                    : Icons.visibility))
            : null,
        hintText: widget.labelText,
        labelText: widget.labelText,
        contentPadding: EdgeInsets.symmetric(
            vertical: widget.boxHeight ?? 12.h,
            horizontal: widget.boxWidth ?? 16.w),
        border: buildOutlineInputBorder(
          borderColor: Colors.white70,
        ),
        focusedBorder: buildOutlineInputBorder(
          borderColor: AppColors.primaryColor,
        ),
        errorBorder: buildOutlineInputBorder(
          borderColor: Colors.red,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.w),
      borderSide: BorderSide(color: borderColor, width: 2.w),
    );
  }
}
