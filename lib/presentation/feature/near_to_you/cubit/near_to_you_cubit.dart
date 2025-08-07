import 'package:aqar_go/domain/model/ad/ad.dart';
import 'package:aqar_go/domain/model/resource.dart';
import 'package:aqar_go/domain/repo/ad_repo.dart';
import 'package:aqar_go/presentation/feature/paging_base/cubit/paging_cubit.dart';
import 'package:aqar_go/presentation/helper/location_permission_manager.dart';

class NearToYouCubit extends PagingCubit<Ad> {
  final LocationPermissionManager _locationPermissionManager;
  final AdRepo _adRepo;

  NearToYouCubit(this._adRepo, this._locationPermissionManager)
    : super(const PagingState.loading([], 1, false));

  @override
  Future<Resource<List<Ad>>> getItems(int page) async {
    await _locationPermissionManager.requestLocationPermission();
    final location = await _locationPermissionManager.getLocation();
    return _adRepo.getNearToYouAds(
      page: page,
      pageSize: pageSize,
      long: location.longitude,
      lat: location.latitude,
    );
  }

  @override
  int pageSize = 5;
}
