import 'package:json_annotation/json_annotation.dart';

part 'aqar_go_links.g.dart';

@JsonSerializable()
class AqarGoLinks {
  final String telegram;
  @JsonKey(name: 'github')
  final String github;

  AqarGoLinks({required this.telegram, required this.github});

  // From JSON
  factory AqarGoLinks.fromJson(Map<String, dynamic> json) =>
      _$AqarGoLinksFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$AqarGoLinksToJson(this);
}
