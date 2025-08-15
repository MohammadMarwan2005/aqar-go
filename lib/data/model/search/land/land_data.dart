part of '../data_search_filter_settings.dart';

@JsonSerializable(includeIfNull: false)
class LandData implements PropertySearchFilterData {
  @JsonKey(name: 'LandType')
  final List<String>? landType;
  @JsonKey(name: 'is_inside_master_plan')
  final bool? isInsideMasterPlan;
  @JsonKey(name: 'is_serviced')
  final bool? isServiced;
  final List<String>? slope;

  LandData({
    this.landType,
    this.isInsideMasterPlan,
    this.isServiced,
    this.slope,
  });

  @override
  factory LandData.fromDomain(SearchFilterSettings settings) => LandData(
    landType: settings.landTypes?.map((type) => type.name).toList(),
    slope: settings.landSlops?.map((type) => type.name).toList(),
    isServiced: settings.landIsServiced,
    isInsideMasterPlan: settings.landIsInsideMasterPlan,
  );

  factory LandData.fromJson(Map<String, dynamic> json) =>
      _$LandDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LandDataToJson(this);
}
