import 'package:aqar_go/data/model/plan/plan_enum.dart';
import 'package:aqar_go/domain/model/resource.dart';

import '../../domain/repo/plan_repo.dart';
import '../api/api_service.dart';
import '../api/safe_api_caller.dart';
import '../model/api_response.dart';

class PlanRepoImpl implements PlanRepo {
  final APIService _apiService;
  final SafeAPICaller _safeAPICaller;

  PlanRepoImpl(this._apiService, this._safeAPICaller);

  @override
  Future<Resource<PlanEnum>> downgrade() async {
    return _safeAPICaller.call<PlanEnum, APIResponse<dynamic>>(
      apiCall: () {
        return _apiService.downgrade();
      },
      dataToDomain: (data) {
        return PlanEnum.free;
      },
    );
  }

  @override
  Future<Resource<PlanEnum>> upgradeToPremium() async {
    return _safeAPICaller.call<PlanEnum, APIResponse<dynamic>>(
      apiCall: () {
        return _apiService.upgradeToPremium();
      },
      dataToDomain: (data) {
        return PlanEnum.premium;
      },
    );
  }
}
