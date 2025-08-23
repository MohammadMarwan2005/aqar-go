part of 'ad_favorite_cubit.dart';

@freezed
sealed class AdFavoriteState with _$AdFavoriteState {
  const factory AdFavoriteState.initial(bool? isFavorite) = _Initial;

  const factory AdFavoriteState.loading(bool? isFavorite) = _Loading;

  const factory AdFavoriteState.error(bool? isFavorite, DomainError error) =
      _Error;

  const factory AdFavoriteState.success(bool? isFavorite) = _Success;
}

extension AdFavoriteStateExtension on AdFavoriteState {
  R when<R>({
    required R Function(bool? isFavorite) initial,
    required R Function(bool? isFavorite) loading,
    required R Function(bool? isFavorite, DomainError error) error,
    required R Function(bool? isFavorite) success,
  }) {
    return switch (this) {
      _Initial(isFavorite: final isFavorite) => initial(isFavorite),
      _Loading(isFavorite: final isFavorite) => loading(isFavorite),
      _Error(isFavorite: final isFavorite, error: final e) => error(
        isFavorite,
        e,
      ),
      _Success(isFavorite: final isFavorite) => success(isFavorite),
    };
  }

  bool get isLoading => this is _Loading;
}
