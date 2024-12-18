import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/text_field_form_widget.dart';
import '../../../../core/widgets/themes_styles.dart';
import '../../../../utils/app_strings.dart';
import '../../provider/auth_provider.dart';

class MiddlePart extends StatelessWidget {
  const MiddlePart({
    super.key,
    required this.userEdtTxtCntr,
    required this.validatorFuncUserEdtTxt,
    required this.passwordEdtTxtCntr,
    required this.validatorFuncPasswordEdtTxt,
  });

  final TextEditingController userEdtTxtCntr;
  final FormFieldValidator<String> validatorFuncUserEdtTxt;
  final TextEditingController passwordEdtTxtCntr;
  final FormFieldValidator<String> validatorFuncPasswordEdtTxt;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, controller, __) {
        return Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            TextFieldFormWidget(
              validatorFunc: validatorFuncUserEdtTxt,
              isPassObscureText: false,
              edtTxtCntr: userEdtTxtCntr,
              labelText: AppString.name,
              isSuffixIconOn: false,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFieldFormWidget(
              validatorFunc: validatorFuncPasswordEdtTxt,
              isPassObscureText: true,
              edtTxtCntr: passwordEdtTxtCntr,
              labelText: AppString.password,
              isSuffixIconOn: true,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<AuthProvider>(
                    builder: (context, controller, ___) {
                      return Row(
                        children: [
                          Checkbox(
                            value: controller.rememberUsername,
                            onChanged: (value) {
                              controller.setRememberUsername(value ?? false);
                            },
                          ),
                          Text('Remember Me'),
                        ],
                      );
                    },
                  ),
                  Text(
                    AppString.forgetPassword,
                    style: TextThemesStyles.primaryColorSubSmall,
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
