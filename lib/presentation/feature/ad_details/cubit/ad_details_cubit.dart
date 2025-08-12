import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/repo/ad_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/ad/ad.dart';

part 'ad_details_state.dart';

part 'ad_details_cubit.freezed.dart';

class AdDetailsCubit extends Cubit<AdDetailsState> {
  final int id;
  final AdRepo _adRepo;

  AdDetailsCubit(this.id, this._adRepo)
    : super(const AdDetailsState.loading()) {
    fetchAd();
  }

  fetchAd() async {
    emit(const AdDetailsState.loading());
    final response = await _adRepo.getAdById(id);
    response.when(
      onSuccess: (successData) {
        emit(AdDetailsState.success(successData));
      },
      onError: (error) {
        emit(AdDetailsState.error(error));
      },
    );
  }
}
