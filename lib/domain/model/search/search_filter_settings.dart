import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aqar_go/domain/model/apartment/furnished_type.dart';
import 'package:aqar_go/domain/model/land/land_type.dart';
import 'package:aqar_go/domain/model/property.dart';
import 'package:aqar_go/domain/model/shop/shop_type.dart';
import '../land/land_slop.dart';

part 'search_filter_settings.freezed.dart';

part 'search_filter_settings.g.dart';

@freezed
abstract class SearchFilterSettings with _$SearchFilterSettings {
  const factory SearchFilterSettings({
    @JsonKey(name: "common,Min Price") int? minPrice,
    @JsonKey(name: "common,Max Price") int? maxPrice,
    @JsonKey(name: "common,Min Area") int? minArea,
    @JsonKey(name: "common,Max Area") int? maxArea,
    @JsonKey(name: "common,Property Type") PropertableEnum? type,

    // apartment
    @JsonKey(name: "apartment,Min Floor") int? apartmentMinFloor,
    @JsonKey(name: "apartment,Max Floor") int? apartmentMaxFloor,
    @JsonKey(name: "apartment,Min Rooms") int? apartmentMinRooms,
    @JsonKey(name: "apartment,Max Rooms") int? apartmentMaxRooms,
    @JsonKey(name: "apartment,Min Bedrooms") int? apartmentMinBedrooms,
    @JsonKey(name: "apartment,Min Bathrooms") int? apartmentMinBathrooms,
    @JsonKey(name: "apartment,Furniture Type")
    List<FurnishedType>? apartmentFurnishedTypes,
    @JsonKey(name: "apartment,Has Alternative Power")
    bool? apartmentHasAlternativePower,
    @JsonKey(name: "apartment,Has Garage") bool? apartmentHasGarage,
    @JsonKey(name: "apartment,Has Furnished") bool? apartmentHasFurnished,
    @JsonKey(name: "apartment,Has Elevator") bool? apartmentHasElevator,

    // land
    @JsonKey(name: "land,Land Type") List<LandType>? landTypes,
    @JsonKey(name: "land,Land Slope") List<LandSlop>? landSlops,
    @JsonKey(name: "land,Serviced") bool? landIsServiced,
    @JsonKey(name: "land,Is Inside Master Plan") bool? landIsInsideMasterPlan,

    // office
    @JsonKey(name: "office,Min Bathrooms") int? officeMinBathrooms,
    @JsonKey(name: "office,Min Meeting Rooms") int? officeMinMeetingRooms,
    @JsonKey(name: "office,Has Parking") bool? officeHasParking,
    @JsonKey(name: "office,Is Furnished") bool? officeIsFurnished,

    // shop
    @JsonKey(name: "shop,Shop Type") List<ShopType>? shopTypes,
    @JsonKey(name: "shop,Has Warehouse") bool? shopHasWarehouse,
    @JsonKey(name: "shop,Has Bathroom") bool? shopHasBathroom,
    @JsonKey(name: "shop,Has Ac") bool? shopHasAc,
  }) = _SearchFilterSettings;

  factory SearchFilterSettings.empty() => const SearchFilterSettings();

  factory SearchFilterSettings.fromJson(Map<String, dynamic> json) =>
      _$SearchFilterSettingsFromJson(json);
}

extension SearchFilterSettingsExtension on SearchFilterSettings {
  List<String> getLabelIds() {
    final json = toJson();
    json.removeWhere((key, value) => value == null);
    final List<String> result = List.empty(growable: true);
    final List<String> commonKeys =
        json.keys
            .where((element) => element.startsWith("common"))
            .map((e) => e.split(",").last)
            .toList();
    result.addAll(commonKeys);
    if (type != null) {
      final propertableName = type!.name.toLowerCase();
      final propertableKeys =
          json.keys
              .where((element) => element.startsWith(propertableName))
              .map((e) => e.split(",").last)
              .toList();
      result.addAll(propertableKeys);
    }

    return result.toList();
  }

  SearchFilterSettings withNullInsteadOfEmptyLists() {
    return copyWith(
      landTypes:
      (landTypes?.isEmpty == true) ? null : landTypes,
      landSlops:
      (landSlops?.isEmpty == true) ? null : landSlops,
      apartmentFurnishedTypes:
      (apartmentFurnishedTypes?.isEmpty == true)
          ? null
          : apartmentFurnishedTypes,
      shopTypes:
      (shopTypes?.isEmpty == true) ? null : shopTypes,
    );
  }
}
