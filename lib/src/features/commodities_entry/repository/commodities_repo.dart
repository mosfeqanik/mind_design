import 'package:dio/dio.dart';

import '../../../core/data/dio/dio_client.dart';
import '../../../core/data/exception/api_error_handler.dart';
import '../../../core/data/model/api_response.dart';
import '../../../utils/api_end_points.dart';
import '../model/customer_entry_model.dart';
import '../model/distribution_entry_model_rmg.dart';
import '../model/distribution_entry_model_ufpo.dart';

class CommoditiesRepo {
  late DioClient? dioClient;

  CommoditiesRepo(this.dioClient);

  Future<ApiResponse> searchCustomer(
      CustomerEntryModel customerEntryBody) async {
    try {
      Response? response = await dioClient?.get(
        "${ApiEndPoints.GET_EMPLOYEE_DETAILS}?is_rmg=${customerEntryBody.isRmg}&mobile=${customerEntryBody.mobile}",
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> createDistributionUfpo(
      DistributionInputDataUFPOModel distributionEntryDataBody) async {
    try {
      Response? response = await dioClient?.post(
        ApiEndPoints.CREATE_UFPO_DISTRIBUTION,
        data: distributionEntryDataBody.toJson(),
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> createDistributionRmg(
      DistributionInputDataRmgModel distributionEntryDataBody) async {
    print(distributionEntryDataBody.toJson());
    try {
      Response? response = await dioClient?.post(
        ApiEndPoints.CREATE_RMG_DISTRIBUTION,
        data: distributionEntryDataBody.toJson(),
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
