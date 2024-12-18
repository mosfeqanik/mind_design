
import '/src/core/widgets/calander_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/btn_widget.dart';
import '../../../core/widgets/custom_appbar_widget.dart';
import '../../../core/widgets/text_field_form_widget.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../dashboard_screen/provider/dashboard_provider.dart';
import '../model/customer_detailed_model.dart';
import '../model/distribution_entry_model_rmg.dart';
import '../model/success_response_data.dart';
import '../provider/commodities_provider.dart';

class CommoditiesEntryCustomerForm extends StatefulWidget {
  final CustomerProduct? customerProductData;

  const CommoditiesEntryCustomerForm({
    super.key,
    this.customerProductData,
  });

  @override
  _CommoditiesEntryCustomerFormState createState() =>
      _CommoditiesEntryCustomerFormState();
}

class _CommoditiesEntryCustomerFormState
    extends State<CommoditiesEntryCustomerForm> {
  final TextEditingController cmntEdtContr = TextEditingController();
  final TextEditingController unitQtyEdtContr = TextEditingController();
  final TextEditingController refillEdtContr = TextEditingController();
  final TextEditingController lotController = TextEditingController();
  int? selectedLot;
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DashboardProvider>(context, listen: false)
          .getLotDetails(widget.customerProductData!.id.toString(), "0");
    });
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lotDetailProvider = context.watch<DashboardProvider>();
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppbarWidget(
        autoLeading: true,
        titleText: widget.customerProductData?.bnName ?? 'NA',
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
                  "${widget.customerProductData?.bnName ?? 'NA'} ${AppString.distributeDescription}",
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
                            children: [
                              // Other widgets
                            ],
                          ),
                        ),
                      ),
                SizedBox(height: 10.h),
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
                          productName: widget.customerProductData?.bnName),
                      isSuffixIconOn: false,
                    ),
                    SizedBox(
                      height: 5.h,
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
                  ],
                ),
                SizedBox(height: 10.h),
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
      required DistributionInputDataRmgModel distributionInputDataModel,
      String? productName}) async {
    SuccessResponseData? successResponse = await commoditiesServiceProvider
        .createDistributionRMGApi(distributionInputDataModel);
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
                        cmntEdtContr.clear;
                        unitQtyEdtContr.clear;
                        refillEdtContr.clear;
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
}
