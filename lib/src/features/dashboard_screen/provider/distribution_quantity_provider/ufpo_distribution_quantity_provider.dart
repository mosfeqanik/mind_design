// import 'package:flutter/material.dart';
// import '../../../../core/data/model/error_response.dart';
// import '../../model/get_available_quantity_model.dart';
// import '../../model/get_distribution_quantity_model.dart';
// import '../../repository/distribution_quantity_repo/ufpo_distribution_quantity_repo.dart';
//
// class UfpoDistributionQuantityProvider with ChangeNotifier {
//   final UfpoDistributionQuantityRepo _ufpoDistributionQuantityRepo;
//   GetDistributionQuantityModel? _data;
//   bool _isLoading = false;
//   String? _error;
//
//   UfpoDistributionQuantityProvider(this._ufpoDistributionQuantityRepo);
//   GetDistributionQuantityModel? _getDistributionQuantityModel;
//   GetDistributionQuantityModel? get getDistributionQuantityModel => _getDistributionQuantityModel;
//
//   GetDistributionQuantityModel? get data => _data;
//   bool get isLoading => _isLoading;
//   String? get error => _error;
//
//   Future<void> fetchDistributionQuantityList(String orgType, String orgID) async {
//     _isLoading = true;
//     notifyListeners();
//
//     try {
//       final apiResponse = await _ufpoDistributionQuantityRepo.ufpoGetDistributionQuantity(orgType: orgType, orgID: orgID);
//       if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
//         _data = GetDistributionQuantityModel.fromJson(apiResponse.response!.data);
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
