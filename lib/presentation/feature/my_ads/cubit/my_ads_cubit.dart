import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/ad/ad.dart';
import '../../../../domain/repo/ad_repo.dart';

part 'my_ads_cubit.freezed.dart';

part 'my_ads_state.dart';

class MyAdsCubit extends Cubit<MyAdsState> {
  final AdRepo _adRepo;

  MyAdsCubit(this._adRepo) : super(const MyAdsState.loading()) {
    getMyAds();
  }

  void getMyAds() async {
    emit(const MyAdsState.loading());
    // the list is 15 at max, so we don't need paging here...
    final response = await _adRepo.getMyAds(page: 1, pageSize: 100);

    response.when(
      onSuccess: (successData) {
        emit(MyAdsState.success(successData));
      },
      onError: (error) {
        emit(MyAdsState.error(error));
      },
    );
  }
}
