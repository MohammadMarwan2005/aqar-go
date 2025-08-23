import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/domain_error.dart';
import '../../../../domain/model/search/search_filter_settings.dart';
import '../../../../domain/repo/ad_repo.dart';
import '../../../../domain/repo/local_data_repo.dart';

part 'notify_me_cubit.freezed.dart';
part 'notify_me_state.dart';

class NotifyMeCubit extends Cubit<NotifyMeState> {
  final AdRepo _adRepo;
  final SearchFilterSettings searchFilterSettings;

  NotifyMeCubit(
    this._adRepo,
    this.searchFilterSettings,
      LocalDataRepo _localDataRepo,
  ) : super(NotifyMeState.initial(_localDataRepo.isGuest()));

  notifyMe() async {
    emit(NotifyMeState.loading(state.isGuest));
    final result = await _adRepo.notifyMe(searchFilterSettings);
    result.when(
      onSuccess: (successData) {
        emit(NotifyMeState.success(state.isGuest));
      },
      onError: (error) {
        emit(NotifyMeState.error(state.isGuest, error));
      },
    );
  }
}
