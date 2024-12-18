import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/btn_widget.dart';
import '../../../core/widgets/calander_widget.dart';
import '../../../core/widgets/custom_appbar_widget.dart';
import '../../../core/widgets/text_field_form_widget.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/local_storage_manager.dart';
import '../../authentication/model/login_model.dart';
import '../../authentication/model/user_detail_model.dart';
import '../../authentication/provider/auth_provider.dart';
import '../../dashboard_screen/provider/dashboard_provider.dart';
import '../model/distribution_entry_model_ufpo.dart';
import '../model/rmg_detailed_model.dart';
import '../model/success_response_data.dart';
import '../provider/commodities_provider.dart';

class CommoditiesEntryRmgForm extends StatefulWidget {
  final RmgProduct? rmgProductData;

  const CommoditiesEntryRmgForm({
    super.key,
    this.rmgProductData,
  });

  @override
  _CommoditiesEntryRmgFormState createState() =>
      _CommoditiesEntryRmgFormState();
}

class _CommoditiesEntryRmgFormState extends State<CommoditiesEntryRmgForm> {
  final TextEditingController cmntEdtContr = TextEditingController();
  final TextEditingController unitQtyEdtContr = TextEditingController();
  final TextEditingController refillEdtContr = TextEditingController();
  final TextEditingController expireEdtController = TextEditingController();
  final TextEditingController mfgAtEdtContr = TextEditingController();
  final TextEditingController lotController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int? selectedLot;
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DashboardProvider>(context, listen: false)
          .getLotDetails(widget.rmgProductData!.id.toString(), "0");
    });
  }

  @override
  Widget build(BuildContext context) {
    final lotDetailProvider = context.watch<DashboardProvider>();
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppbarWidget(
        autoLeading: true,
        titleText: widget.rmgProductData?.bnName ?? 'NA',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20.h),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.rmgProductData?.bnName ?? 'NA'} ${AppString.distributeDescription}",
                  style: TextStyle(fontSize: 20.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                lotDetailProvider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        alignment: Alignment.topCenter,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [],
                          ),
                        ),
                      ),
                SizedBox(height: 15.h),
                Column(
                  children: [
                    TextFieldFormWidget(
                      validatorFunc: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      isPassObscureText: false,
                      boxHeight: 15.h,
                      edtTxtCntr: unitQtyEdtContr,
                      labelText: AppString.todyRcv(
                          productName: widget.rmgProductData?.bnName),
                      isSuffixIconOn: false,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CalenderWidget(
                      datePickerController: refillEdtContr,
                      validatorFunc: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      hintTextTile: AppString.refillDate,
                      labelText: AppString.refillDate,
                    ),
                    SizedBox(height: 10.h),
                    CalenderWidget(
                      datePickerController: mfgAtEdtContr,
                      validatorFunc: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      hintTextTile: AppString.mfgDate,
                      labelText: AppString.mfgDate,
                    ),
                    SizedBox(height: 10.h),
                    CalenderWidget(
                      datePickerController: expireEdtController,
                      validatorFunc: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      hintTextTile: AppString.expirationDate,
                      labelText: AppString.expirationDate,
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                TextFieldFormWidget(
                  validatorFunc: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  isPassObscureText: false,
                  boxHeight: 20.h,
                  edtTxtCntr: cmntEdtContr,
                  labelText: AppString.yourComment,
                  isSuffixIconOn: false,
                ),
                SizedBox(height: 20.h),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> distributionPostFunc(BuildContext context,
      {required CommoditiesServiceProvider commoditiesServiceProvider,
      required DistributionInputDataUFPOModel distributionInputDataModel,
      String? productName}) async {
    SuccessResponseData? successResponse = await commoditiesServiceProvider
        .createDistributionUFPOApi(distributionInputDataModel);
    try {
      if (successResponse?.message != null) {
        if (context.mounted) {
          Dialog errorDialog = Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.w),
            ),
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
                      style: TextStyle(fontSize: 20.sp, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.w),
                    child: const Text(
                      textAlign: TextAlign.center,
                      AppString.SuccessMessage,
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
                        expireEdtController.clear;
                        cmntEdtContr.clear;
                        unitQtyEdtContr.clear;
                        refillEdtContr.clear;
                        expireEdtController.clear;
                        mfgAtEdtContr.clear;
                        lotController.clear();
                        WidgetsBinding.instance.addPostFrameCallback((_) {});
                        Navigator.of(context).pop();
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
              context: context, builder: (BuildContext context) => errorDialog);
        }
        return successResponse?.message;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Error: $e'),
        ),
      );
    }
    return null;
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Center(
            child: AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0.0))),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/fpimages/cardiogram.png",
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'রসিদ কপি',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                content: SizedBox(
                  height: 550,
                  width: MediaQuery.of(context).size.width * 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      _containerRow(
                          sizedBoxWidth: 0,
                          borderWidth: null,
                          titleOne: "কমোডিটির নাম",
                          subTitleOne: widget.rmgProductData?.bnName ?? 'NA',
                          titleTwo: '',
                          subTitleTwo: ''),
                      _containerRow(
                          sizedBoxWidth: 65,
                          borderWidth: 0,
                          titleOne: "কমোডিটির পরিমান",
                          subTitleOne: unitQtyEdtContr.text,
                          titleTwo: "রিফিল তারিখ",
                          subTitleTwo: refillEdtContr.text),
                      _containerRow(
                          sizedBoxWidth: 65,
                          borderWidth: 0,
                          titleOne: "মেয়াদ উত্তীর্ণ তারিখ",
                          subTitleOne: expireEdtController.text,
                          titleTwo: "উৎপাদন তারিখ",
                          subTitleTwo: mfgAtEdtContr.text),
                      _containerRow(
                          sizedBoxWidth: 0,
                          borderWidth: null,
                          titleOne: "আপনার মন্তব্য",
                          subTitleOne: cmntEdtContr.text,
                          titleTwo: '',
                          subTitleTwo: ''),
                      TextFieldFormWidget(
                          txtType: TextInputType.number,
                          labelText: "Password",
                          validatorFunc: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          edtTxtCntr: passwordController,
                          isPassObscureText: true),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Edit'),
                  ),
                  Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                    // if (authProvider.isLoading &&
                    //     authProvider.userDetail?.token != null) {
                    //   return const Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // }
                    //  else {
                    return TextButton(
                      onPressed: () async {
                        loginFunc(context, authProvider);

                        // if (_formKey.currentState!.validate()) {
                        // if (passwordController.text.isEmpty) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       backgroundColor: Colors.redAccent,
                        //       content: Text('Password is required'),
                        //     ),
                        //   );
                        // }
                        // } else
                        if (_formKey.currentState!.validate()) {
                          String? successMessage = await distributionPostFunc(
                            context,
                            commoditiesServiceProvider:
                                Provider.of<CommoditiesServiceProvider>(context,
                                    listen: false),
                            distributionInputDataModel:
                                DistributionInputDataUFPOModel(
                              productId: widget.rmgProductData?.id,
                              itemLotId: selectedLot,
                              customerId:
                                  Provider.of<CommoditiesServiceProvider>(
                                          context,
                                          listen: false)
                                      .rmgDetailData
                                      .rmg
                                      ?.id,
                              isRmg: 1,
                              refilAt: DateTime.tryParse(refillEdtContr.text),
                              expiryAt:
                                  DateTime.tryParse(expireEdtController.text),
                              mfgAt: DateTime.tryParse(mfgAtEdtContr.text),
                              note: cmntEdtContr.text,
                              unitQty: int.tryParse(unitQtyEdtContr.text),
                            ),
                            productName: widget.rmgProductData?.name,
                          );
                          await Future.delayed(const Duration(seconds: 3));
                          // successMessage != null
                          //     ? controller.success()
                          //     : controller.reset();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text(AppString.pleaseTryAgain),
                            ),
                          );
                        }
                        unitQtyEdtContr.clear();
                        cmntEdtContr.clear();
                        refillEdtContr.clear();
                        expireEdtController.clear();
                        mfgAtEdtContr.clear();
                        lotController.clear();
                      },
                      child: const Text('Submit'),
                    );
                  })
                ]),
          ),
        );
      },
    );
  }

  Widget _containerRow({
    String? titleOne,
    String? subTitleOne,
    String? titleTwo,
    String? subTitleTwo,
    double? borderWidth,
    double? sizedBoxWidth,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleOne!,
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  subTitleOne!,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              width: sizedBoxWidth,
            ),
            borderWidth != null
                ? Container(
                    width: borderWidth,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5)),
                  )
                : Container(),
            SizedBox(
              width: sizedBoxWidth,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleTwo!,
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  subTitleTwo!,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          width: double.infinity,
          height: 1,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 0.5)),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }

  void loginFunc(BuildContext context, AuthProvider authProvider) async {
    var userData = await LocalStorageManager.readData(AppConstants.USERJson);
    UserDetail? saveUserDetail = UserDetail.fromJson(
      jsonDecode(
        userData,
      ),
    );
    UserDetail? userDetail = await authProvider.loginUser(
      LoginModel(
        password: passwordController.text,
        deviceName: "YourDeviceName",
      ),
    );
  }

// void _submitData() async {
//   if (_formKey.currentState!.validate()) {
//     Consumer<AuthProvider>(builder: (context, authProvider, child) {
//       if (_formKey.currentState!.validate()) {
//         loginFunc(context, authProvider);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             backgroundColor: Colors.redAccent,
//             content: Text(AppString.pleaseTryAgain),
//           ),
//         );
//       }
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     });
//     String? successMessage = await distributionPostFunc(
//       context,
//       commoditiesServiceProvider:
//           Provider.of<CommoditiesServiceProvider>(context, listen: false),
//       distributionInputDataModel: DistributionInputDataUFPOModel(
//         productId: widget.rmgProductData?.id,
//         itemLotId: selectedLot,
//         customerId:
//             Provider.of<CommoditiesServiceProvider>(context, listen: false)
//                 .rmgDetailData
//                 .rmg
//                 ?.id,
//         isRmg: 1,
//         refilAt: DateTime.tryParse(refillEdtContr.text),
//         expiryAt: DateTime.tryParse(expireEdtController.text),
//         mfgAt: DateTime.tryParse(mfgAtEdtContr.text),
//         note: cmntEdtContr.text,
//         unitQty: int.tryParse(unitQtyEdtContr.text),
//       ),
//       productName: widget.rmgProductData?.name,
//     );
//     await Future.delayed(const Duration(seconds: 3));
//     successMessage != null
//         ? controller.success()
//         : controller.reset(); // Starts success animation
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         backgroundColor: Colors.redAccent,
//         content: Text(AppString.pleaseTryAgain),
//       ),
//     );
//   }
//   unitQtyEdtContr.clear();
//   cmntEdtContr.clear();
//   refillEdtContr.clear();
//   expireEdtController.clear();
//   mfgAtEdtContr.clear();
//   lotController.clear();
// }
}
