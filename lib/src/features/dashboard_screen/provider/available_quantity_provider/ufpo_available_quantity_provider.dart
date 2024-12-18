// import 'package:flutter/material.dart';
// import '../../../../core/data/model/error_response.dart';
// import '../../model/get_available_quantity_model.dart';
// import '../../repository/available_quantity_repo/ufpo_available_quantity_repo.dart';
//
// class UfpoAvailableQuantityProvider with ChangeNotifier {
//   final UfpoAvailableQuantityRepo _ufpoAvailableQuantityRepo;
//   GetAvailableQuantityModel? _data;
//   bool _isLoading = false;
//   String? _error;
//
//   UfpoAvailableQuantityProvider(this._ufpoAvailableQuantityRepo);
//
//   GetAvailableQuantityModel? _getAvailableQuantityModel;
//   GetAvailableQuantityModel? get getAvailableQuantityModel => _getAvailableQuantityModel;
//
//   GetAvailableQuantityModel? get data => _data;
//   bool get isLoading => _isLoading;
//   String? get error => _error;
//
//   Future<void> fetchAvailableQuantityList(String orgType, String orgID) async {
//     _isLoading = true;
//     notifyListeners();
//
//     try {
//       final apiResponse = await _ufpoAvailableQuantityRepo.ufpoGetAvailableQuantity(orgType: orgType, orgID: orgID);
//       if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
//         _data = GetAvailableQuantityModel.fromJson(apiResponse.response!.data);
//         print(_data!.data![0].availableQty);
//       } else {
//         if (apiResponse.error is String) {
//           _error = apiResponse.error.toString();
//         } else {
//           final errorResponse = apiResponse.error as ErrorResponse;
//           _error = errorResponse.errors![0].message;
//         }
//       }
//     } catch (e) {
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }
