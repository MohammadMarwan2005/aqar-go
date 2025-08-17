import '../../../domain/model/report/report_reason.dart';

enum DataReportReason {
  sexualContent('sexual_content'),
  harassment('harassment'),
  spam('spam'),
  hateSpeech('hate_speech'),
  violence('violence'),
  scam('scam'),
  fakeInformation('fake_information'),
  other('other');

  final String backendValue;

  const DataReportReason(this.backendValue);

  factory DataReportReason.fromDomain(ReportReason reason) {
    return DataReportReason.values.firstWhere(
      (element) => element.name == reason.name,
      orElse: () => DataReportReason.other,
    );
  }
}
