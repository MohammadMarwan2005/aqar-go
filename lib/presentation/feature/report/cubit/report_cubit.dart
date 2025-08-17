import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/domain_error.dart';
import '../../../../domain/model/report/report_reason.dart';
import '../../../../domain/repo/ad_repo.dart';

part 'report_cubit.freezed.dart';
part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  final int adId;
  final AdRepo _adRepo;

  ReportCubit(this.adId, this._adRepo)
    : super(ReportState.initial(null));

  final ValueNotifier<bool> isReportSheetOpen = ValueNotifier(false);

  bool get isSheetOpen => isReportSheetOpen.value;

  set isSheetOpen(bool value) => isReportSheetOpen.value = value;

  final TextEditingController otherReasonController = TextEditingController();

  submitReport() async {
    String? description = otherReasonController.text;
    if (description.isEmpty) description = null;

    emit(ReportState.loading(state.selectedReason));

    final result = await _adRepo.reportAd(
      adId,
      state.selectedReason!,
      description: description,
    );

    result.when(
      onSuccess: (successData) {
        emit(ReportState.success(state.selectedReason));
        otherReasonController.clear();
        emit(ReportState.initial(null));
      },
      onError: (error) {
        emit(ReportState.error(error, state.selectedReason));
        emit(ReportState.initial(state.selectedReason));
      },
    );
  }

  selectReason(ReportReason reason) {
    emit(
      state.copyWith(selectedReason: reason),
    );
  }

  @override
  Future<void> close() {
    otherReasonController.dispose();
    isReportSheetOpen.dispose();
    return super.close();
  }
}
