import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/btn_widget.dart';
import '../../../../core/widgets/custom_appbar_widget.dart';
import '../../../../core/widgets/text_field_form_widget.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../authentication/presentation/customer_user_details/customer_user_details_screen.dart';
import '../../../authentication/presentation/rmg_user_details/rmg_user_details_screen.dart';
import '../../model/customer_detailed_model.dart';
import '../../model/customer_entry_model.dart';
import '../../model/rmg_detailed_model.dart';
import '../../provider/commodities_provider.dart';

class MobileNumberEntryScreen extends StatefulWidget {
  final String? orgType;

  const MobileNumberEntryScreen({super.key, this.orgType});

  @override
  State<MobileNumberEntryScreen> createState() =>
      _MobileNumberEntryScreenState();
}

class _MobileNumberEntryScreenState extends State<MobileNumberEntryScreen> {
  final TextEditingController mobileEdtController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RmgResponseData rmgDetailData = RmgResponseData();
  CustomerResponseData customerDetailData = CustomerResponseData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const CustomAppbarWidget(
        autoLeading: true,
        titleText: AppString.mobileNmbrEntry,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20.h),
        child: Form(
          key: _formKey,
          child: Consumer<CommoditiesServiceProvider>(
            builder: (context, commoditiesServiceProvider, child) {
              return Column(
                children: [
                  Text(
                    AppString.cmdiDtailsSeeMbleNmbr,
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextFieldFormWidget(
                    validatorFunc: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    txtType: TextInputType.number,
                    isPassObscureText: false,
                    edtTxtCntr: mobileEdtController,
                    isSuffixIconOn: false,
                    labelText: AppString.mobileNumber,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  BtnWidget(
                    btnTitle: AppString.submitText,
                    btnFunc: () async {
                      if (_formKey.currentState!.validate()) {
                        await customerPostFunc(
                          context,
                          commoditiesProvider: commoditiesServiceProvider,
                          customerEntryModel: CustomerEntryModel(
                            isRmg: widget.orgType == "ufpo" ? "1" : "0",
                            mobile: mobileEdtController.text,
                          ),
                        );
                        if (rmgDetailData.rmg?.name != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RMGDetailScreen(),
                            ),
                          );
                          mobileEdtController.clear();
                        } else if (customerDetailData.customer?.name != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CustomerDetailScreen(),
                            ),
                          );
                          mobileEdtController.clear();
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text(AppString.pleaseTryAgain),
                          ),
                        );
                      }
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> customerPostFunc(
    BuildContext context, {
    required CommoditiesServiceProvider commoditiesProvider,
    required CustomerEntryModel customerEntryModel,
  }) async {
    commoditiesProvider.mobileNumber = customerEntryModel.mobile!;
    commoditiesProvider.isRmg = customerEntryModel.isRmg!;
    if (customerEntryModel.isRmg == "0") {
      customerDetailData = (await commoditiesProvider.searchCustomerAPI(
        customerEntryModel,
      ))!;
    } else {
      rmgDetailData = (await commoditiesProvider.searchRmgAPI(
        customerEntryModel,
      ))!;
    }
  }
}
