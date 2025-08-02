import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/model/resource.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/repo/ad_repo.dart';

part 'my_ad_actions_state.dart';

part 'my_ad_actions_cubit.freezed.dart';

class MyAdActionsCubit extends Cubit<MyAdActionsState> {
  final int adId;
  final AdRepo _adRepo;

  MyAdActionsCubit(this.adId, this._adRepo)
    : super(const MyAdActionsState.initial());

  void doAction(MyAdAction action) async {
    emit(MyAdActionsState.loading(action));

    final function = getFunction(action);
    final response = await function(adId);
    response.when(
      onSuccess: (successData) {
        emit(MyAdActionsState.success(action));
      },
      onError: (error) {
        emit(MyAdActionsState.error(error, action));
      },
    );
  }

  Future<Resource<void>> Function(int adId) getFunction(MyAdAction action) {
    switch (action) {
      case MyAdAction.activate:
        return _adRepo.activateAd;
      case MyAdAction.deactivate:
        return _adRepo.deactivateAd;
      case MyAdAction.delete:
        return _adRepo.deleteAd;
    }
  }
}

enum MyAdAction { activate, deactivate, delete }
