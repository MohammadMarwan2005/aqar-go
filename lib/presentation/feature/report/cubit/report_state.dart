part of 'report_cubit.dart';

@freezed
sealed class ReportState with _$ReportState {
  const factory ReportState.initial(ReportReason? selectedReason) = _Initial;

  const factory ReportState.loading(ReportReason? selectedReason) = _Loading;

  const factory ReportState.error(DomainError error, ReportReason? selectedReason) =
      _Error;

  const factory ReportState.success(ReportReason? selectedReason) = _Success;
}

extension ReportStateExt on ReportState {
  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(DomainError error) error,
    required R Function() success,
  }) {
    switch (this) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Error(error: var domainError):
        return error(domainError);
      case _Success():
        return success();
    }
  }

  bool isLoading() => this is _Loading;
}
