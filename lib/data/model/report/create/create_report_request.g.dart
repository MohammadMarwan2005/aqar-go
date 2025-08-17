// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReportRequest _$CreateReportRequestFromJson(Map<String, dynamic> json) =>
    CreateReportRequest(
      adId: (json['ad_id'] as num).toInt(),
      reason: json['reason'] as String,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$CreateReportRequestToJson(
  CreateReportRequest instance,
) => <String, dynamic>{
  'ad_id': instance.adId,
  'reason': instance.reason,
  if (instance.comment case final value?) 'comment': value,
};
