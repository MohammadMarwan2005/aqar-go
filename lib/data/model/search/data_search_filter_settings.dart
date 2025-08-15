import 'package:aqar_go/data/model/apartment/data_furnished_type.dart';
import 'package:aqar_go/data/model/search/property_search_filter_data.dart';
import 'package:aqar_go/domain/model/property.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/search/search_filter_settings.dart';

part 'apartment/apartment_data.dart';
part 'data_search_filter_settings.g.dart';
part 'land/land_data.dart';
part 'office/office_data.dart';
part 'shop/shop_data.dart';

@JsonSerializable(includeIfNull: false)
class DataSearchFilterSettings {
  @JsonKey(name: 'num')
  final int pageSize;

  @JsonKey(name: 'min_price')
  final int? minPrice;

  @JsonKey(name: 'max_price')
  final int? maxPrice;

  @JsonKey(name: 'min_area')
  final int? minArea;

  @JsonKey(name: 'max_area')
  final int? maxArea;

  /// apartment, land, office, shop
  final String? type;

  final Map<String, dynamic>? data;

  DataSearchFilterSettings({
    required this.pageSize,
    this.minPrice,
    this.maxPrice,
    this.minArea,
    this.maxArea,
    this.type,
    this.data,
  });

  factory DataSearchFilterSettings.fromJson(Map<String, dynamic> json) =>
      _$DataSearchFilterSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DataSearchFilterSettingsToJson(this);

  factory DataSearchFilterSettings.fromDomain(
    SearchFilterSettings settings,
    int pageSize,
  ) {
    // if the list is empty, then we need to set it to null
    final settingsWithNullListsIfEmpty = settings.withNullInsteadOfEmptyLists();

    final data =
        switch (settingsWithNullListsIfEmpty.type) {
          null => null,
          PropertableEnum.land => LandData.fromDomain(
            settingsWithNullListsIfEmpty,
          ),
          PropertableEnum.shop => ShopData.fromDomain(
            settingsWithNullListsIfEmpty,
          ),
          PropertableEnum.office => OfficeData.fromDomain(
            settingsWithNullListsIfEmpty,
          ),
          PropertableEnum.apartment => ApartmentData.fromDomain(
            settingsWithNullListsIfEmpty,
          ),
        }?.toJson();

    return DataSearchFilterSettings(
      minPrice: settings.minPrice,
      maxPrice: settings.maxPrice,
      minArea: settings.minArea,
      maxArea: settings.maxArea,
      type: settings.type?.name,
      data: data,
      pageSize: pageSize,
    );
  }
}
