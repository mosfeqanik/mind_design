import 'package:dio/dio.dart';

import '../../../core/data/dio/dio_client.dart';
import '../../../core/data/exception/api_error_handler.dart';
import '../../../core/data/model/api_response.dart';
import '../../../utils/api_end_points.dart';
import '../model/login_model.dart';

class AuthRepo {
  late DioClient? dioClient;

  AuthRepo(this.dioClient);

  Future<ApiResponse> login(LoginModel loginBody) async {
    try {
      Response? response = await dioClient?.post(
        ApiEndPoints.LOGIN_URI,
        data: loginBody.toJson(),
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getAuthME() async {
    try {
      Response? response = await dioClient?.get(
        ApiEndPoints.AUTH_ME,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> logoutAPI() async {
    try {
      Response? response = await dioClient?.post(
        ApiEndPoints.LOGOUT_URI,
        data: {},
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
