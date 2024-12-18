import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/data/model/api_response.dart';
import '../../../core/data/model/error_response.dart';
import '../../../utils/app_colors.dart';
import '../model/customer_detailed_model.dart';
import '../model/customer_entry_model.dart';
import '../model/distribution_entry_model_rmg.dart';
import '../model/distribution_entry_model_ufpo.dart';
import '../model/rmg_detailed_model.dart';
import '../model/success_response_data.dart';
import '../repository/commodities_repo.dart';

class CommoditiesServiceProvider extends ChangeNotifier {
  final CommoditiesRepo commoditiesRepo;

  CommoditiesServiceProvider(this.commoditiesRepo);

  String? _error;

  String? get error => _error;
  bool isLoading = false;
  CustomerResponseData customerDetailData = CustomerResponseData();

  Future<CustomerResponseData?> searchCustomerAPI(
      CustomerEntryModel customerBody) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse =
        await commoditiesRepo.searchCustomer(customerBody);
    _error = null;
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      customerDetailData =
          CustomerResponseData.fromJson(apiResponse.response?.data);
      isLoading = false;
      notifyListeners();
      return customerDetailData;
    } else {
      if (apiResponse.error is String) {
        _error = apiResponse.error.toString();
        Fluttertoast.showToast(
          msg: "$_error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
        );
        isLoading = false;
        notifyListeners();
      } else {
        final errorResponse = apiResponse.error as ErrorResponse;
        _error = errorResponse.errors![0].message;
        Fluttertoast.showToast(
          msg: "$_error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
        );
        isLoading = false;
        notifyListeners();
      }
    }
    return null;
  }

  RmgResponseData rmgDetailData = RmgResponseData();

  Future<RmgResponseData?> searchRmgAPI(CustomerEntryModel customerBody) async {
    isLoading = true;
    notifyListeners();
    ApiResponse apiResponse =
        await commoditiesRepo.searchCustomer(customerBody);
    _error = null;
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      rmgDetailData = RmgResponseData.fromJson(apiResponse.response?.data);
      Fluttertoast.showToast(
        msg: "${rmgDetailData.message}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
      );
      isLoading = false;
      notifyListeners();
      return rmgDetailData;
    } else {
      if (apiResponse.error is String) {
        _error = apiResponse.error.toString();
        Fluttertoast.showToast(
          msg: "$_error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
        );
        isLoading = false;
        notifyListeners();
      } else {
        final errorResponse = apiResponse.error as ErrorResponse;
        _error = errorResponse.errors![0].message;
        Fluttertoast.showToast(
          msg: "$_error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
        );
        isLoading = false;
        notifyListeners();
      }
    }
    return null;
  }

  bool _isToggled = true;

  bool get isToggled => _isToggled;

  void toggleBool() {
    _isToggled = !_isToggled;
    notifyListeners();
  }

  Future<SuccessResponseData?> createDistributionUFPOApi(
      DistributionInputDataUFPOModel inventoryEntryData) async {
    ApiResponse? apiResponse;
    isLoading = true;
    _error = null;
    notifyListeners();
    try {
      apiResponse =
          await commoditiesRepo.createDistributionUfpo(inventoryEntryData);
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 201) {
        SuccessResponseData successResponse = SuccessResponseData.fromJson(
          apiResponse.response?.data,
        );
        callAgainSearchCustomer();
        isLoading = false;
        notifyListeners();
        return successResponse;
      } else {
        if (apiResponse.error is String) {
          _error = apiResponse.error.toString();
          isLoading = false;
          notifyListeners();
          Fluttertoast.showToast(
            msg: "$_error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: AppColors.primaryColor,
            textColor: Colors.white,
          );
        } else {
          final errorResponse = apiResponse.error as ErrorResponse;
          _error = errorResponse.errors![0].message;
          isLoading = false;
          notifyListeners();
          Fluttertoast.showToast(
            msg: "$_error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: AppColors.primaryColor,
            textColor: Colors.white,
          );
        }
      }
    } on DioException catch (e) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
      );
      isLoading = false;
      throw Exception('Failed to fetch inventory: $e');
    }
    return null;
  }

  Future<SuccessResponseData?> createDistributionRMGApi(
      DistributionInputDataRmgModel inventoryEntryData) async {
    ApiResponse? apiResponse;
    isLoading = true;
    _error = null;
    notifyListeners();
    try {
      apiResponse =
          await commoditiesRepo.createDistributionRmg(inventoryEntryData);
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        SuccessResponseData successResponse = SuccessResponseData.fromJson(
          apiResponse.response?.data,
        );
        isLoading = false;
        callAgainSearchCustomer();
        notifyListeners();
        return successResponse;
      } else {
        if (apiResponse.error is String) {
          _error = apiResponse.error.toString();
          isLoading = false;
          notifyListeners();
          Fluttertoast.showToast(
            msg: "$_error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: AppColors.primaryColor,
            textColor: Colors.white,
          );
        } else {
          final errorResponse = apiResponse.error as ErrorResponse;
          _error = errorResponse.errors![0].message;
          isLoading = false;
          notifyListeners();
          Fluttertoast.showToast(
            msg: "$_error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: AppColors.primaryColor,
            textColor: Colors.white,
          );
        }
      }
    } on DioException catch (e) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
      );
      isLoading = false;
      throw Exception('Failed to post distribution inventory: $e');
    }
    return null;
  }

  String _mobileNumber = "";

  // Getter for mobileNumber
  String get mobileNumber => _mobileNumber;

  // Setter for mobileNumber
  set mobileNumber(String value) {
    _mobileNumber = value;
    notifyListeners(); // Notify listeners when the value changes
  }

  String _isRmg = "";

  // Getter for isRmg
  String get isRmg => _isRmg;

  // Setter for isRmg
  set isRmg(String value) {
    _isRmg = value;
    notifyListeners(); // Notify listeners when the value changes
  }

  void callAgainSearchCustomer() {
    if (isRmg == "0") {
      searchCustomerAPI(
        CustomerEntryModel(mobile: mobileNumber, isRmg: isRmg),
      );
    } else {
      searchRmgAPI(
        CustomerEntryModel(mobile: mobileNumber, isRmg: isRmg),
      );
    }
  }
}
