// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activate_selected_ads_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivateSelectedAdsRequest _$ActivateSelectedAdsRequestFromJson(
  Map<String, dynamic> json,
) => ActivateSelectedAdsRequest(
  all: (json['all'] as num).toInt(),
  ads: (json['ads'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
);

Map<String, dynamic> _$ActivateSelectedAdsRequestToJson(
  ActivateSelectedAdsRequest instance,
) => <String, dynamic>{'all': instance.all, 'ads': instance.ads};
