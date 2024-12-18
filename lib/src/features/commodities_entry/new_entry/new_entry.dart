import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/btn_widget.dart';
import '../../../core/widgets/custom_appbar_widget.dart';
import '../../../core/widgets/text_field_form_widget.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_strings.dart';

class NewUserEntry extends StatefulWidget {
  const NewUserEntry({super.key});

  @override
  State<NewUserEntry> createState() => _NewUserEntryState();
}

class _NewUserEntryState extends State<NewUserEntry> {
  final TextEditingController nameContr = TextEditingController();
  final TextEditingController phoneContr = TextEditingController();
  final TextEditingController ageContr = TextEditingController();
  final TextEditingController ocupationContr = TextEditingController();
  final TextEditingController presentAddressContr = TextEditingController();
  final TextEditingController presentWorkPlaceContr = TextEditingController();
  List<String> gender = ["নতুন", "পুরাতন"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarWidget(
        autoLeading: true,
        titleText: AppString.newEntryTxt,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.newWkerInfoSave,
                style: TextStyle(fontSize: 16.sp, color: Colors.black),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFieldFormWidget(
                validatorFunc: (value) {
                  return null;
                },
                isPassObscureText: false,
                boxHeight: 20.h,
                labelText: AppString.name,
                isSuffixIconOn: false,
                edtTxtCntr: nameContr,
              ),
              SizedBox(
                height: 5.h,
              ),
              TextFieldFormWidget(
                validatorFunc: (value) {
                  return null;
                },
                isPassObscureText: false,
                boxHeight: 20.h,
                labelText: AppString.mobileNumber,
                isSuffixIconOn: false,
                edtTxtCntr: phoneContr,
              ),
              SizedBox(
                height: 5.h,
              ),
              DropdownMenu(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.w),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                    ),
                  ),
                  width: 360.w,
                  label: const Text(AppString.gender),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: "পুরুষ"),
                    DropdownMenuEntry(value: 2, label: "মহিলা"),
                    DropdownMenuEntry(value: 3, label: "অন্যান্য "),
                  ]),
              SizedBox(
                height: 5.h,
              ),
              TextFieldFormWidget(
                validatorFunc: (value) {
                  return null;
                },
                isPassObscureText: false,
                boxHeight: 20.h,
                labelText: AppString.age,
                isSuffixIconOn: false,
                edtTxtCntr: ageContr,
              ),
              SizedBox(
                height: 5.h,
              ),
              TextFieldFormWidget(
                validatorFunc: (value) {
                  return null;
                },
                isPassObscureText: false,
                boxHeight: 20.h,
                labelText: AppString.occupation,
                isSuffixIconOn: false,
                edtTxtCntr: ocupationContr,
              ),
              SizedBox(
                height: 5.h,
              ),
              DropdownMenu(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.w),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.w,
                      ),
                    ),
                  ),
                  width: 360.w,
                  label: const Text(AppString.maritialStatus),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: "বিবাহিত"),
                    DropdownMenuEntry(value: 2, label: "অবিবাহিত"),
                    DropdownMenuEntry(value: 3, label: "অন্যান্য"),
                  ]),
              SizedBox(
                height: 5.h,
              ),
              DropdownMenu(
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.w),
                      borderSide: BorderSide(
                        width: 1.w,
                      ),
                    ),
                  ),
                  width: 360.w,
                  label: const Text(AppString.childrenNmbr),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: "নেই"),
                    DropdownMenuEntry(value: 2, label: "একজন"),
                    DropdownMenuEntry(value: 3, label: "দুইজন"),
                    DropdownMenuEntry(value: 4, label: "তিনজন"),
                    DropdownMenuEntry(value: 5, label: "চারজন"),
                    DropdownMenuEntry(value: 6, label: "পাঁচজন"),
                    DropdownMenuEntry(value: 7, label: "ছয়জন"),
                  ]),
              SizedBox(
                height: 5.h,
              ),
              TextFieldFormWidget(
                validatorFunc: (value) {
                  return null;
                },
                isPassObscureText: false,
                boxHeight: 20.h,
                labelText: AppString.presentAddress,
                isSuffixIconOn: false,
                edtTxtCntr: presentAddressContr,
              ),
              SizedBox(
                height: 5.h,
              ),
              TextFieldFormWidget(
                validatorFunc: (value) {
                  return null;
                },
                isPassObscureText: false,
                boxHeight: 20.h,
                labelText: AppString.presentWorkPlace,
                isSuffixIconOn: false,
                edtTxtCntr: presentWorkPlaceContr,
              ),
              SizedBox(
                height: 10.h,
              ),
              BtnWidget(
                btnFunc: () {
                  Dialog errorDialog = Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.w)),
                    child: Container(
                      height: 300.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.w)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            AppAssets.successImg,
                            height: 50.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.w),
                            child: Text(
                              AppString.thanks,
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.w),
                            child: const Text(
                              textAlign: TextAlign.center,
                              AppString.newEntrySuccUpdate,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60.w),
                            child: BtnWidget(
                              btnFunc: () {
                                Navigator.of(context).pop();
                              },
                              btnTitle: AppString.correctText,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => errorDialog);
                },
                btnTitle: AppString.saveText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
