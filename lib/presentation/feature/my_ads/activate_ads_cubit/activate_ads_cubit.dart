import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/repo/ad_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activate_ads_state.dart';

part 'activate_ads_cubit.freezed.dart';

class ActivateAdsCubit extends Cubit<ActivateAdsState> {
  final AdRepo _adRep;

  ActivateAdsCubit(this._adRep) : super(const ActivateAdsState.initial());

  void activateAd() async {
    emit(ActivateAdsState.loading());
    final response = await _adRep.activateAllAds();
    response.when(
      onSuccess: (successData) {
        emit(ActivateAdsState.success());
      },
      onError: (error) {
        emit(ActivateAdsState.error(error));
      },
    );
  }
}
