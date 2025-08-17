import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/model/report/report_reason.dart';
import '../data_report_reason.dart';

part 'create_report_request.g.dart';

@JsonSerializable(includeIfNull: false)
class CreateReportRequest {
  @JsonKey(name: 'ad_id')
  final int adId;
  final String reason;
  final String? comment;

  const CreateReportRequest({
    required this.adId,
    required this.reason,
    this.comment,
  });

  /// Factory + toJson
  factory CreateReportRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReportRequestToJson(this);

  /// Mapping from domain
  factory CreateReportRequest.fromDomain({
    required int adId,
    required ReportReason reason,
  }) {
    return CreateReportRequest(
      adId: adId,
      reason: DataReportReason.fromDomain(reason).backendValue,
    );
  }
}
