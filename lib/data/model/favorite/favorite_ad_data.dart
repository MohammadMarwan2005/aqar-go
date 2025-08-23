import 'package:aqar_go/data/model/ad/ad_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_ad_data.g.dart';

@JsonSerializable()
class FavoriteAdData {
  @JsonKey(name: 'ad')
  final AdData ad;

  FavoriteAdData(this.ad);

  factory FavoriteAdData.fromJson(Map<String, dynamic> json) =>
      _$FavoriteAdDataFromJson(json);
}
