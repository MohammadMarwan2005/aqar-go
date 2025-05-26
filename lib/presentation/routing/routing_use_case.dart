import 'package:aqar_go/data/repo/local_data_repo.dart';
import 'package:aqar_go/presentation/routing/routes.dart';

class RoutingUseCase {
  final LocalDataRepo _localDataRepo;

  RoutingUseCase(this._localDataRepo);

  Future<String> getFirstRoute() async {
    final token = await _localDataRepo.getToken();
    if (token != null) return Routes.home;
    return Routes.onboarding;
  }
}
