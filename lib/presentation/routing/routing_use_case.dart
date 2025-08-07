import 'package:aqar_go/data/repo/local_data_repo.dart';
import 'package:aqar_go/presentation/routing/routes.dart';

class RoutingUseCase {
  final LocalDataRepo _localDataRepo;

  RoutingUseCase(this._localDataRepo);

  Future<String> getFirstRoute() async {
    final onboarded = _localDataRepo.hasOnboarded();
    if(!onboarded) return Routes.onboarding;
    return Routes.home;
  }
}
