import 'package:aqar_go/domain/model/land/land_slop.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/land/land_type.dart';
import '../../../domain/model/property.dart';

part 'land_data.g.dart';

@JsonSerializable()
class LandData {
  final String type;
  final String slope;
  @JsonKey(name: 'is_serviced')
  final bool isServiced;
  @JsonKey(name: 'is_inside_master_plan')
  final bool isInsideMasterPlan;

  LandData({
    required this.type,
    required this.slope,
    required this.isServiced,
    required this.isInsideMasterPlan,
  });

  factory LandData.fromJson(Map<String, dynamic> json) =>
      _$LandDataFromJson(json);

  Map<String, dynamic> toJson() => _$LandDataToJson(this);

  static LandData fromDomain(Land land) => LandData(
    type: land.landType.name,
    slope: land.landSlop.name,
    isServiced: land.isServiced,
    isInsideMasterPlan: land.isInsideMasterPlan,
  );

  Land toDomain() => Land(
    landType: LandType.values.firstWhere((e) => e.name == type),
    landSlop: LandSlop.values.firstWhere((e) => e.name == slope),
    isServiced: isServiced,
    isInsideMasterPlan: isInsideMasterPlan,
  );
}
