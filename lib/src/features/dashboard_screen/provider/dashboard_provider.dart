import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../core/data/model/api_response.dart';
import '../../../core/data/model/error_response.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/local_storage_manager.dart';
import '../../authentication/model/user_detail_model.dart';
import '../model/get_available_quantity_model.dart';
import '../model/get_distribution_quantity_model.dart';
import '../model/get_lot_detail_model.dart';
import '../repository/dashboard_repo.dart';

class DashboardProvider extends ChangeNotifier {
  final DashBoardRepo _dashBoardRepo;

  DashboardProvider(this._dashBoardRepo, this._selectedIndex);

  int _selectedIndex;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  GetLotDetailedListData _lotDetailedListData = GetLotDetailedListData();

  GetLotDetailedListData get lotDetailedListData => _lotDetailedListData;

  GetAvailableQuantityModel? _availableQuantityData;
  bool _isLoading = false;
  String? _error;
  UserDetail userDetail = UserDetail();

  GetAvailableQuantityModel? get availableQuantityData =>
      _availableQuantityData;

  bool get isLoading => _isLoading;

  String? get error => _error;
  GetDistributionQuantityModel? _distributionQuantityData;

  GetDistributionQuantityModel? get distributionQuantityData =>
      _distributionQuantityData;

  Future<GetLotDetailedListData?> getLotDetailsApi(
      {String? productId, String? ufpoId}) async {
    String? orgParams = userDetail.representative?.orgType == "ufpo"
        ? "ufpo_id=${userDetail.representative!.ufpo!.id}"
        : "rmg_id=${userDetail.representative!.rmg!.id}";
    ApiResponse apiResponse = await _dashBoardRepo.getLotDetails(
        productId: productId, orgParams: orgParams);
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      GetLotDetailedListData lotDetailedData =
          GetLotDetailedListData.fromJson(apiResponse.response?.data);
      return lotDetailedData;
    } else {
      String? errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.errors?[0].message;
      }
    }
    return null;
  }

  Future<void> fetchAvailableQuantityList(
      {String? orgType, String? orgID}) async {
    _isLoading = true;
    notifyListeners();
    try {
      final apiResponse = await _dashBoardRepo.rmgGetAvailableQuantity(
          orgType: orgType, orgID: orgID);
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _availableQuantityData =
            GetAvailableQuantityModel.fromJson(apiResponse.response!.data);
        _isLoading = false;
        notifyListeners();
      } else {
        if (apiResponse.error is String) {
          _error = apiResponse.error.toString();
          _isLoading = false;
        } else {
          final errorResponse = apiResponse.error as ErrorResponse;
          _error = errorResponse.errors![0].message;
          _isLoading = false;
        }
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDistributionQuantityList(
      {String? orgType, String? orgID}) async {
    _isLoading = true;
    notifyListeners();
    try {
      final apiResponse = await _dashBoardRepo.ufpoGetDistributionQuantity(
          orgType: orgType, orgID: orgID);
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _distributionQuantityData =
            GetDistributionQuantityModel.fromJson(apiResponse.response!.data);
        notifyListeners();
      } else {
        if (apiResponse.error is String) {
          _error = apiResponse.error.toString();
          notifyListeners();
        } else {
          final errorResponse = apiResponse.error as ErrorResponse;
          _error = errorResponse.errors![0].message;
          notifyListeners();
        }
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String? orgType = "";
  String? orgId = "";

  void loadData() async {
    var userData = await LocalStorageManager.readData(AppConstants.USERJson);
    userDetail = UserDetail.fromJson(
      jsonDecode(
        userData,
      ),
    );
    orgType = userDetail.representative?.orgType;
    orgId = userDetail.representative?.orgType == "ufpo"
        ? userDetail.representative!.ufpo!.id.toString()
        : userDetail.representative!.rmg!.id.toString();
    fetchAvailableQuantityList(orgType: "$orgType", orgID: orgId);
    fetchDistributionQuantityList(orgType: "$orgType", orgID: orgId);
  }

  Future<void> getLotDetails(String? productId, isAllOn) async {
    _isLoading = true;
    notifyListeners();
    String? orgParams = userDetail.representative?.orgType == "ufpo"
        ? "ufpo_id=${userDetail.representative!.ufpo!.id}"
        : "rmg_id=${userDetail.representative!.rmg!.id}";
    ApiResponse apiResponse = await _dashBoardRepo.getLotDetails(
      productId: productId,
      orgParams: orgParams,
      isAllOn: isAllOn,
    );
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _lotDetailedListData =
          GetLotDetailedListData.fromJson(apiResponse.response?.data);
    } else {
      _lotDetailedListData = GetLotDetailedListData();
    }
    _isLoading = false;
    notifyListeners();
  }
}
