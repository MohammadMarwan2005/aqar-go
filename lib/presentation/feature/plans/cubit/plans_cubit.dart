import 'package:aqar_go/domain/model/resource.dart';
import 'package:aqar_go/domain/repo/plan_repo.dart';
import 'package:aqar_go/presentation/feature/profile/show/profile_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/model/plan/plan_enum.dart';
import '../../../../domain/model/domain_error.dart';
import '../plan.dart';

part 'plans_cubit.freezed.dart';
part 'plans_state.dart';

class PlansCubit extends Cubit<PlansState> {
  final PlanRepo _planRepo;

  PlansCubit(this._planRepo, {required bool isPremium})
    : super(PlansState.initial(isPremium ? PlanEnum.premium : PlanEnum.free));

  upgradeToPremium() async {
    emit(PlansState.loading(state.planEnum));
    final response = await _planRepo.upgradeToPremium();
    _handleResponse(response);
  }

  downgrade() async {
    emit(PlansState.loading(state.planEnum));
    final response = await _planRepo.downgrade();
    _handleResponse(response);
  }

  _handleResponse(Resource<PlanEnum> response) {
    response.when(
      onSuccess: (successData) {
        emit(PlansState.success(successData));
      },
      onError: (error) {
        emit(PlansState.error(state.planEnum, error));
      },
    );
  }

  _loadAndEmit(PlanEnum planEnum) async {
    emit(PlansState.loading(planEnum));
    await Future.delayed(const Duration(seconds: 2));
    emit(PlansState.success(planEnum));
  }

  makeError() async {
    emit(PlansState.loading(state.planEnum));
    await Future.delayed(const Duration(seconds: 2));
    emit(PlansState.error(state.planEnum, DomainError.unknownError));
  }

  static List<Plan> plans = [Plan.free, Plan.premium];
}

class PlansScreenArgs {
  final bool isPremium;
  final ProfileCubit profileCubit;

  PlansScreenArgs({required this.isPremium, required this.profileCubit});
}
