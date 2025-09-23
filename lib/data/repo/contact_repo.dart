import 'package:aqar_go/data/api/api_service.dart';
import 'package:aqar_go/domain/model/resource.dart';

import '../../domain/repo/contact_repo.dart';
import '../api/safe_api_caller.dart';
import '../model/api_response.dart';
import '../model/links/aqar_go_links.dart';

class ContactRepoImpl implements ContactRepo {
  final APIService _apiService;
  final SafeAPICaller _safeAPICaller;

  ContactRepoImpl(this._apiService, this._safeAPICaller);

  @override
  Future<Resource<String>> getTelegramLink() async {
    return _safeAPICaller.call<String, APIResponse<String>>(
      apiCall: () => _apiService.getTelegramLink(),
      dataToDomain: (response) => response.data,
    );
  }

  @override
  Future<Resource<String>> getTelegramUsername() async {
    return _safeAPICaller.call<String, APIResponse<String>>(
      apiCall: () => _apiService.getTelegramUsername(),
      dataToDomain: (response) => response.data,
    );
  }
  @override
  Future<Resource<AqarGoLinks>> getAqarGoLinks() async {
    return _safeAPICaller.call<AqarGoLinks, APIResponse<AqarGoLinks>>(
      apiCall: () => _apiService.getAqarGoLinks(),
      dataToDomain: (response) => response.data,
    );
  }
}
