import 'package:aqar_go/domain/model/ad/ad.dart';
import 'package:aqar_go/domain/model/resource.dart';
import 'package:aqar_go/domain/repo/ad_repo.dart';
import 'package:aqar_go/presentation/feature/paging_base/cubit/paging_cubit.dart';

class RecommendedAdsCubit extends PagingCubit<Ad> {
  final AdRepo _adRepo;

  RecommendedAdsCubit(this._adRepo)
    : super(const PagingState.loading([], 1, false));

  @override
  Future<Resource<List<Ad>>> getItems(int page) async {
    return _adRepo.getRecommendedAds(page: page, pageSize: pageSize);
  }

  @override
  int pageSize = 5;
}
