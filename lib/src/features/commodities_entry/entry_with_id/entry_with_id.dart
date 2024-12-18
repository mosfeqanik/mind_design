import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/btn_widget.dart';
import '../../../core/widgets/custom_appbar_widget.dart';
import '../../../core/widgets/text_field_form_widget.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';

class UserIdEntryScreen extends StatefulWidget {
  const UserIdEntryScreen({super.key});

  @override
  State<UserIdEntryScreen> createState() => _UserIdEntryScreenState();
}

class _UserIdEntryScreenState extends State<UserIdEntryScreen> {
  final TextEditingController mobileEdtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const CustomAppbarWidget(
        autoLeading: true,
        titleText: AppString.idTxt,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
        child: Column(
          children: [
            Text(
              AppString.cmdiDtailsSeeID,
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(
              height: 12.h,
            ),
            TextFieldFormWidget(
              validatorFunc: (value) {
                return null;
              },
              isPassObscureText: false,
              edtTxtCntr: mobileEdtController,
              isSuffixIconOn: false,
              labelText: AppString.idTxt,
            ),
            SizedBox(
              height: 12.h,
            ),
            BtnWidget(
              btnFunc: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => UserDetailScreen(
                //       customerDetailedData: customerDetailedData,
                //     ),
                //   ),
                // );
              },
              btnTitle: AppString.submitText,
            )
          ],
        ),
      ),
    );
  }
}
