import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/data/model/api_response.dart';
import '../../../core/data/model/error_response.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/local_storage_manager.dart';
import '../../commodities_entry/model/success_response_data.dart';
import '../model/login_model.dart';
import '../model/user_detail_model.dart';
import '../repository/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo authRepo;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  AuthProvider(this.authRepo) : super();
  UserDetail? userDetail = UserDetail();

  Future<UserDetail?> loginUser(LoginModel loginBody) async {
    _isLoading = true;
    notifyListeners();
    try {
      ApiResponse apiResponse = await authRepo.login(loginBody);
      if (apiResponse.response != null &&
          apiResponse.response?.statusCode == 200) {
        userDetail = UserDetail.fromJson(
          apiResponse.response?.data,
        );
        LocalStorageManager.saveData(
          AppConstants.USERJson,
          jsonEncode(
            userDetail,
          ),
        );
        LocalStorageManager.saveData(
          AppConstants.TOKEN,
          userDetail?.token ?? "",
        );
        _isLoading = false;
        notifyListeners();
        return userDetail;
      } else {
        if (apiResponse.error is String) {
          _error = apiResponse.error.toString();
          _isLoading = false;
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
          _isLoading = false;
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
      _isLoading = false;
      notifyListeners();
      UserDetail();
    }
    return UserDetail();
  }

  Future<void> getUserDetails() async {
    try {
      ApiResponse apiResponse = await authRepo.getAuthME();
      if (apiResponse.response != null &&
          apiResponse.response?.statusCode == 200) {
        userDetail = UserDetail.fromJson(apiResponse.response?.data);
        notifyListeners();
      } else {
        _handleError(apiResponse.error);
      }
    } catch (e) {
      // Handle exceptions
    }
  }

  void _handleError(dynamic error) {
    String? errorMessage;
    if (error is String) {
      errorMessage = error;
    } else if (error is ErrorResponse) {
      errorMessage = error.errors?[0].message;
    }
    Fluttertoast.showToast(
      msg: "$errorMessage",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      // Position at bottom
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
    );
    print(errorMessage);
  }

  bool _isPasswordVisible = true;

  bool get isPasswordVisibility => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  SuccessResponseData? successResponse = SuccessResponseData();
  String? _error;

  String? get error => _error;

  Future<String?> logOut() async {
    ApiResponse? apiResponse;
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      apiResponse = await authRepo.logoutAPI();
      print(apiResponse);
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        LocalStorageManager.deleteData(AppConstants.USERJson);
        LocalStorageManager.deleteData(AppConstants.TOKEN);
        successResponse = SuccessResponseData.fromJson(
          apiResponse.response?.data,
        );
        _isLoading = false;
        notifyListeners();
        Fluttertoast.showToast(
          msg: "${successResponse?.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: AppColors.greenColor,
          textColor: Colors.white,
        );
        return successResponse?.message ?? "";
      } else {
        if (apiResponse.error is String) {
          _error = apiResponse.error.toString();
          _isLoading = false;
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
          _isLoading = false;
          notifyListeners();
          Fluttertoast.showToast(
            msg: "$_error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: AppColors.primaryColor,
            textColor: Colors.white,
          );
          notifyListeners();
        }
      }
      _isLoading = false;
    } on DioException catch (e) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
      );
      _isLoading = false;
      throw Exception('Failed to fetch inventory: $e');
    }
    return null;
  }

  bool _rememberUsername = false;
  String? _username;

  bool get rememberUsername => _rememberUsername;

  String? get username => _username;

  void setRememberUsername(bool value) {
    _rememberUsername = value;
    notifyListeners();
  }

  void setUsername(String? name) {
    _username = name;
    notifyListeners();
  }
}
