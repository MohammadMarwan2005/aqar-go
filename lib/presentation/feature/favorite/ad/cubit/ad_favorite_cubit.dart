import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/model/resource.dart';
import 'package:aqar_go/domain/repo/ad_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_favorite_state.dart';

part 'ad_favorite_cubit.freezed.dart';

class AdFavoriteCubit extends Cubit<AdFavoriteState> {
  final AdRepo _adRepo;
  final int adId;

  AdFavoriteCubit(this._adRepo, this.adId)
    : super(AdFavoriteState.initial(null));

  loadInitial(bool? value) {
    emit(AdFavoriteState.initial(value));
  }

  toggleFavorite() async {
    if (state.isFavorite == null || state.isLoading) return;
    final bool current = state.isFavorite!; // true or false
    emit(AdFavoriteState.loading(!current)); // immediately update the ui
    final Future<Resource<dynamic>> Function(int adId) todo =
        current ? _adRepo.removeFromFavourite : _adRepo.addToFavourite;
    final response = await todo(adId);
    response.when(
      onSuccess: (successData) {
        emit(AdFavoriteState.success(!current));
      },
      onError: (error) {
        emit(AdFavoriteState.error(current, error));
      },
    );
  }
}
