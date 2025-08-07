import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../../domain/model/domain_error.dart';
import '../plan.dart';

part 'plans_cubit.freezed.dart';
part 'plans_state.dart';

class PlansCubit extends Cubit<PlansState> {
  PlansCubit({required bool isPremium}) : super(PlansState.initial(isPremium));

  goPremium() async {
    _loadAndEmit(true);
  }

  goFree() async {
    _loadAndEmit(false);
  }


  _loadAndEmit(bool isPremium) async {
    emit(PlansState.loading(isPremium));
    await Future.delayed(const Duration(seconds: 2));
    emit(PlansState.success(isPremium));
  }

  makeError() async {
    emit(PlansState.loading(state.isPremium));
    await Future.delayed(const Duration(seconds: 2));
    emit(PlansState.error(state.isPremium, DomainError.unknownError));
  }

  static List<Plan> plans = [
    Plan(
      nameId: "Free",
      isPremium: false,
      priceInDollar: 0,
      features: [
        PlanFeature(
          nameId: "3 ads maximum",
          isAvailable: true,
          iconData: Symbols.ad_off,
        ),
        PlanFeature(
          nameId: "Standard ad reach",
          isAvailable: true,
          iconData: Symbols.search,
        ),
        PlanFeature(
          nameId: "Basic support",
          isAvailable: true,
          iconData: Symbols.support,
        ),
      ],
    ),
    Plan(
      nameId: "Premium",
      isPremium: true,
      priceInDollar: 4.99,
      features: [
        PlanFeature(
          nameId: "Up to 15 ads",
          isAvailable: true,
          iconData: Symbols.all_inclusive,
        ),
        PlanFeature(
          nameId: "Priority ad reach",
          isAvailable: true,
          iconData: Symbols.query_stats,
        ),
        PlanFeature(
          nameId: "24/7 Premium support",
          isAvailable: true,
          iconData: Symbols.support_agent,
        ),
        PlanFeature(
          nameId: "More...",
          isAvailable: true,
          iconData: Symbols.diamond,
        ),
      ],
    ),
  ];
}
