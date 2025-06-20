part of 'profile_cubit.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.error(DomainError error) = _Error;
  const factory ProfileState.success(UserProfile profile) = _Success;
}

extension X on ProfileState {
  R when<R>({
    required R Function() loading,
    required R Function(DomainError domainError) error,
    required R Function(UserProfile profile) success,
  }) {
    switch (this) {
      case _Loading():
        return loading();
      case _Error(error: var domainError):
        return error(domainError);
      case _Success(profile: var profile):
        return success(profile);
    }
  }
}