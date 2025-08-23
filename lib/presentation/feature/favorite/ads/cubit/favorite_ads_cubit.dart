import 'package:aqar_go/domain/model/ad/ad.dart';
import 'package:aqar_go/domain/model/resource.dart';
import 'package:aqar_go/domain/repo/ad_repo.dart';
import 'package:aqar_go/presentation/feature/paging_base/cubit/paging_cubit.dart';

class FavoriteAdsCubit extends PagingCubit<Ad> {
  final AdRepo _adRepo;

  FavoriteAdsCubit(this._adRepo)
    : super(const PagingState.loading([], 1, false));

  @override
  int pageSize = 5;

  @override
  Future<Resource<List<Ad>>> getItems(int page) {
    return _adRepo.getFavouriteAds(page: page, pageSize: pageSize);
  }
}
