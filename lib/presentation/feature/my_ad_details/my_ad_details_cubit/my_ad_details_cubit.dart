import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/repo/ad_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/ad/ad.dart';

part 'my_ad_details_cubit.freezed.dart';
part 'my_ad_details_state.dart';


class MyAdDetailsCubit extends Cubit<MyAdDetailsState> {
  final int adId;
  final AdRepo _adRepo;

  MyAdDetailsCubit(this.adId, this._adRepo)
    : super(const MyAdDetailsState.loading()) {
    fetchMyAd();
  }

  void fetchMyAd() async {
    emit(const MyAdDetailsState.loading());

    final response = await _adRepo.getAdById(adId);
    response.when(
      onSuccess: (successData) {
        emit(MyAdDetailsState.success(successData));
      },
      onError: (error) {
        emit(MyAdDetailsState.error(error));
      },
    );
  }
}
