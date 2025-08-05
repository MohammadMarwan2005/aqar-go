import 'package:aqar_go/data/api/api_service.dart';
import 'package:aqar_go/data/api/safe_api_caller.dart';
import 'package:aqar_go/data/model/api_response.dart';
import 'package:aqar_go/data/model/auth/auth_response_data.dart';
import 'package:aqar_go/data/model/auth/login_request.dart';
import 'package:aqar_go/data/model/auth/register_request.dart';
import 'package:aqar_go/domain/model/profile/user_profile.dart';
import 'package:aqar_go/domain/model/resource.dart';

import '../model/profile/user/data_user.dart';

class AuthRepo {
  final APIService _apiService;
  final SafeAPICaller _safeAPICaller;

  AuthRepo(this._apiService, this._safeAPICaller);

  Future<Resource<AuthResponseData>> login(LoginRequest request) async {
    return _safeAPICaller.call<AuthResponseData, APIResponse<AuthResponseData>>(
      apiCall: () {
        return _apiService.login(request);
      },
      dataToDomain: (data) {
        return data.data;
      },
    );
  }

  Future<Resource<AuthResponseData>> register(RegisterRequest request) async {
    return _safeAPICaller.call<AuthResponseData, APIResponse<AuthResponseData>>(
      apiCall: () {
        return _apiService.register(request);
      },
      dataToDomain: (data) {
        return data.data;
      },
    );
  }

  Future<Resource<UserProfile>> getProfile() async {
    return _safeAPICaller.call<UserProfile, APIResponse<DataUser>>(
      apiCall: () {
        return _apiService.getProfile();
      },
      dataToDomain: (data) {
        return data.data.toDomain();
      },
    );
  }

  Future<Resource<dynamic>> sendVerificationEmail() async {
    return _safeAPICaller.call<dynamic, APIResponse<dynamic>>(
      apiCall: () {
        return _apiService.sendVerificationEmail();
      },
      dataToDomain: (data) {
        return data.data;
      },
    );
  }
}
