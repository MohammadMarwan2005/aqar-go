part of 'my_properties_cubit.dart';

@freezed
sealed class MyPropertiesState with _$MyPropertiesState {
  const factory MyPropertiesState.loading() = _Loading;
  const factory MyPropertiesState.error(DomainError error) = _Error;
  const factory MyPropertiesState.success(List<Property> properties) = _Success;
}


extension X on MyPropertiesState {
  R when<R>({
    required R Function() loading,
    required R Function(DomainError domainError) error,
    required R Function(List<Property> properties) success,
  }) {
    switch (this) {
      case _Loading():
        return loading();
      case _Error(error: var domainError):
        return error(domainError);
      case _Success(properties: var properties):
        return success(properties);
    }
  }
}
