import 'package:aqar_go/data/model/plan/plan_enum.dart';
import 'package:aqar_go/domain/model/resource.dart';

abstract class PlanRepo {
  Future<Resource<PlanEnum>> upgradeToPremium();

  Future<Resource<PlanEnum>> downgrade();
}
