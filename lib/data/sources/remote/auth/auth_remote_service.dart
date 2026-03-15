import 'package:auth/core/network/api_endpoints.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/network/api_clients.dart';
import '../../../../core/resources/utils/utils.dart';
import '../../../../core/services/shared_preference/shared_preference.dart';
import '../../../models/response_model.dart';

class AuthRemoteService {
  final ApiClient apiClient;
  AuthRemoteService({required this.apiClient});

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  Future<ResponseModel> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final body = {"email": email, "password": password};
      final response = await apiClient.postRequest(
        endpoints: ApiEndpoints.login,
        body: body,
      );
      final String? accessToken = response["authorization"]["access_token"];
      if (accessToken != null) {
        await SharedPreferenceData.setToken(accessToken);
        ApiClient.headerSet(accessToken);
      }
      if (response['success'] == true) {
        Utils.showToast(
          message: response['message'],
          backgroundColor: CupertinoColors.systemGreen,
          textColor: CupertinoColors.black,
        );
        return ResponseModel(isSuccess: true, message: response['message']);
      } else {
        return ResponseModel(isSuccess: false, message: response['message']);
      }
    } catch (e) {
      return ResponseModel(isSuccess: false, message: e.toString());
    }
  }
}
