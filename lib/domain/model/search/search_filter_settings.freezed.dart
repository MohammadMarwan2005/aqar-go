// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_filter_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchFilterSettings {

@JsonKey(name: "common,Min Price") int? get minPrice;@JsonKey(name: "common,Max Price") int? get maxPrice;@JsonKey(name: "common,Min Area") int? get minArea;@JsonKey(name: "common,Max Area") int? get maxArea;@JsonKey(name: "common,Property Type") PropertableEnum? get type;// apartment
@JsonKey(name: "apartment,Min Floor") int? get apartmentMinFloor;@JsonKey(name: "apartment,Max Floor") int? get apartmentMaxFloor;@JsonKey(name: "apartment,Min Rooms") int? get apartmentMinRooms;@JsonKey(name: "apartment,Max Rooms") int? get apartmentMaxRooms;@JsonKey(name: "apartment,Min Bedrooms") int? get apartmentMinBedrooms;@JsonKey(name: "apartment,Min Bathrooms") int? get apartmentMinBathrooms;@JsonKey(name: "apartment,Furniture Type") List<FurnishedType>? get apartmentFurnishedTypes;@JsonKey(name: "apartment,Has Alternative Power") bool? get apartmentHasAlternativePower;@JsonKey(name: "apartment,Has Garage") bool? get apartmentHasGarage;@JsonKey(name: "apartment,Has Furnished") bool? get apartmentHasFurnished;@JsonKey(name: "apartment,Has Elevator") bool? get apartmentHasElevator;// land
@JsonKey(name: "land,Land Type") List<LandType>? get landTypes;@JsonKey(name: "land,Land Slope") List<LandSlop>? get landSlops;@JsonKey(name: "land,Serviced") bool? get landIsServiced;@JsonKey(name: "land,Is Inside Master Plan") bool? get landIsInsideMasterPlan;// office
@JsonKey(name: "office,Min Bathrooms") int? get officeMinBathrooms;@JsonKey(name: "office,Min Meeting Rooms") int? get officeMinMeetingRooms;@JsonKey(name: "office,Has Parking") bool? get officeHasParking;@JsonKey(name: "office,Is Furnished") bool? get officeIsFurnished;// shop
@JsonKey(name: "shop,Shop Type") List<ShopType>? get shopTypes;@JsonKey(name: "shop,Has Warehouse") bool? get shopHasWarehouse;@JsonKey(name: "shop,Has Bathroom") bool? get shopHasBathroom;@JsonKey(name: "shop,Has Ac") bool? get shopHasAc;
/// Create a copy of SearchFilterSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchFilterSettingsCopyWith<SearchFilterSettings> get copyWith => _$SearchFilterSettingsCopyWithImpl<SearchFilterSettings>(this as SearchFilterSettings, _$identity);

  /// Serializes this SearchFilterSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchFilterSettings&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.minArea, minArea) || other.minArea == minArea)&&(identical(other.maxArea, maxArea) || other.maxArea == maxArea)&&(identical(other.type, type) || other.type == type)&&(identical(other.apartmentMinFloor, apartmentMinFloor) || other.apartmentMinFloor == apartmentMinFloor)&&(identical(other.apartmentMaxFloor, apartmentMaxFloor) || other.apartmentMaxFloor == apartmentMaxFloor)&&(identical(other.apartmentMinRooms, apartmentMinRooms) || other.apartmentMinRooms == apartmentMinRooms)&&(identical(other.apartmentMaxRooms, apartmentMaxRooms) || other.apartmentMaxRooms == apartmentMaxRooms)&&(identical(other.apartmentMinBedrooms, apartmentMinBedrooms) || other.apartmentMinBedrooms == apartmentMinBedrooms)&&(identical(other.apartmentMinBathrooms, apartmentMinBathrooms) || other.apartmentMinBathrooms == apartmentMinBathrooms)&&const DeepCollectionEquality().equals(other.apartmentFurnishedTypes, apartmentFurnishedTypes)&&(identical(other.apartmentHasAlternativePower, apartmentHasAlternativePower) || other.apartmentHasAlternativePower == apartmentHasAlternativePower)&&(identical(other.apartmentHasGarage, apartmentHasGarage) || other.apartmentHasGarage == apartmentHasGarage)&&(identical(other.apartmentHasFurnished, apartmentHasFurnished) || other.apartmentHasFurnished == apartmentHasFurnished)&&(identical(other.apartmentHasElevator, apartmentHasElevator) || other.apartmentHasElevator == apartmentHasElevator)&&const DeepCollectionEquality().equals(other.landTypes, landTypes)&&const DeepCollectionEquality().equals(other.landSlops, landSlops)&&(identical(other.landIsServiced, landIsServiced) || other.landIsServiced == landIsServiced)&&(identical(other.landIsInsideMasterPlan, landIsInsideMasterPlan) || other.landIsInsideMasterPlan == landIsInsideMasterPlan)&&(identical(other.officeMinBathrooms, officeMinBathrooms) || other.officeMinBathrooms == officeMinBathrooms)&&(identical(other.officeMinMeetingRooms, officeMinMeetingRooms) || other.officeMinMeetingRooms == officeMinMeetingRooms)&&(identical(other.officeHasParking, officeHasParking) || other.officeHasParking == officeHasParking)&&(identical(other.officeIsFurnished, officeIsFurnished) || other.officeIsFurnished == officeIsFurnished)&&const DeepCollectionEquality().equals(other.shopTypes, shopTypes)&&(identical(other.shopHasWarehouse, shopHasWarehouse) || other.shopHasWarehouse == shopHasWarehouse)&&(identical(other.shopHasBathroom, shopHasBathroom) || other.shopHasBathroom == shopHasBathroom)&&(identical(other.shopHasAc, shopHasAc) || other.shopHasAc == shopHasAc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,minPrice,maxPrice,minArea,maxArea,type,apartmentMinFloor,apartmentMaxFloor,apartmentMinRooms,apartmentMaxRooms,apartmentMinBedrooms,apartmentMinBathrooms,const DeepCollectionEquality().hash(apartmentFurnishedTypes),apartmentHasAlternativePower,apartmentHasGarage,apartmentHasFurnished,apartmentHasElevator,const DeepCollectionEquality().hash(landTypes),const DeepCollectionEquality().hash(landSlops),landIsServiced,landIsInsideMasterPlan,officeMinBathrooms,officeMinMeetingRooms,officeHasParking,officeIsFurnished,const DeepCollectionEquality().hash(shopTypes),shopHasWarehouse,shopHasBathroom,shopHasAc]);

@override
String toString() {
  return 'SearchFilterSettings(minPrice: $minPrice, maxPrice: $maxPrice, minArea: $minArea, maxArea: $maxArea, type: $type, apartmentMinFloor: $apartmentMinFloor, apartmentMaxFloor: $apartmentMaxFloor, apartmentMinRooms: $apartmentMinRooms, apartmentMaxRooms: $apartmentMaxRooms, apartmentMinBedrooms: $apartmentMinBedrooms, apartmentMinBathrooms: $apartmentMinBathrooms, apartmentFurnishedTypes: $apartmentFurnishedTypes, apartmentHasAlternativePower: $apartmentHasAlternativePower, apartmentHasGarage: $apartmentHasGarage, apartmentHasFurnished: $apartmentHasFurnished, apartmentHasElevator: $apartmentHasElevator, landTypes: $landTypes, landSlops: $landSlops, landIsServiced: $landIsServiced, landIsInsideMasterPlan: $landIsInsideMasterPlan, officeMinBathrooms: $officeMinBathrooms, officeMinMeetingRooms: $officeMinMeetingRooms, officeHasParking: $officeHasParking, officeIsFurnished: $officeIsFurnished, shopTypes: $shopTypes, shopHasWarehouse: $shopHasWarehouse, shopHasBathroom: $shopHasBathroom, shopHasAc: $shopHasAc)';
}


}

/// @nodoc
abstract mixin class $SearchFilterSettingsCopyWith<$Res>  {
  factory $SearchFilterSettingsCopyWith(SearchFilterSettings value, $Res Function(SearchFilterSettings) _then) = _$SearchFilterSettingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "common,Min Price") int? minPrice,@JsonKey(name: "common,Max Price") int? maxPrice,@JsonKey(name: "common,Min Area") int? minArea,@JsonKey(name: "common,Max Area") int? maxArea,@JsonKey(name: "common,Property Type") PropertableEnum? type,@JsonKey(name: "apartment,Min Floor") int? apartmentMinFloor,@JsonKey(name: "apartment,Max Floor") int? apartmentMaxFloor,@JsonKey(name: "apartment,Min Rooms") int? apartmentMinRooms,@JsonKey(name: "apartment,Max Rooms") int? apartmentMaxRooms,@JsonKey(name: "apartment,Min Bedrooms") int? apartmentMinBedrooms,@JsonKey(name: "apartment,Min Bathrooms") int? apartmentMinBathrooms,@JsonKey(name: "apartment,Furniture Type") List<FurnishedType>? apartmentFurnishedTypes,@JsonKey(name: "apartment,Has Alternative Power") bool? apartmentHasAlternativePower,@JsonKey(name: "apartment,Has Garage") bool? apartmentHasGarage,@JsonKey(name: "apartment,Has Furnished") bool? apartmentHasFurnished,@JsonKey(name: "apartment,Has Elevator") bool? apartmentHasElevator,@JsonKey(name: "land,Land Type") List<LandType>? landTypes,@JsonKey(name: "land,Land Slope") List<LandSlop>? landSlops,@JsonKey(name: "land,Serviced") bool? landIsServiced,@JsonKey(name: "land,Is Inside Master Plan") bool? landIsInsideMasterPlan,@JsonKey(name: "office,Min Bathrooms") int? officeMinBathrooms,@JsonKey(name: "office,Min Meeting Rooms") int? officeMinMeetingRooms,@JsonKey(name: "office,Has Parking") bool? officeHasParking,@JsonKey(name: "office,Is Furnished") bool? officeIsFurnished,@JsonKey(name: "shop,Shop Type") List<ShopType>? shopTypes,@JsonKey(name: "shop,Has Warehouse") bool? shopHasWarehouse,@JsonKey(name: "shop,Has Bathroom") bool? shopHasBathroom,@JsonKey(name: "shop,Has Ac") bool? shopHasAc
});




}
/// @nodoc
class _$SearchFilterSettingsCopyWithImpl<$Res>
    implements $SearchFilterSettingsCopyWith<$Res> {
  _$SearchFilterSettingsCopyWithImpl(this._self, this._then);

  final SearchFilterSettings _self;
  final $Res Function(SearchFilterSettings) _then;

/// Create a copy of SearchFilterSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minPrice = freezed,Object? maxPrice = freezed,Object? minArea = freezed,Object? maxArea = freezed,Object? type = freezed,Object? apartmentMinFloor = freezed,Object? apartmentMaxFloor = freezed,Object? apartmentMinRooms = freezed,Object? apartmentMaxRooms = freezed,Object? apartmentMinBedrooms = freezed,Object? apartmentMinBathrooms = freezed,Object? apartmentFurnishedTypes = freezed,Object? apartmentHasAlternativePower = freezed,Object? apartmentHasGarage = freezed,Object? apartmentHasFurnished = freezed,Object? apartmentHasElevator = freezed,Object? landTypes = freezed,Object? landSlops = freezed,Object? landIsServiced = freezed,Object? landIsInsideMasterPlan = freezed,Object? officeMinBathrooms = freezed,Object? officeMinMeetingRooms = freezed,Object? officeHasParking = freezed,Object? officeIsFurnished = freezed,Object? shopTypes = freezed,Object? shopHasWarehouse = freezed,Object? shopHasBathroom = freezed,Object? shopHasAc = freezed,}) {
  return _then(_self.copyWith(
minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as int?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as int?,minArea: freezed == minArea ? _self.minArea : minArea // ignore: cast_nullable_to_non_nullable
as int?,maxArea: freezed == maxArea ? _self.maxArea : maxArea // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PropertableEnum?,apartmentMinFloor: freezed == apartmentMinFloor ? _self.apartmentMinFloor : apartmentMinFloor // ignore: cast_nullable_to_non_nullable
as int?,apartmentMaxFloor: freezed == apartmentMaxFloor ? _self.apartmentMaxFloor : apartmentMaxFloor // ignore: cast_nullable_to_non_nullable
as int?,apartmentMinRooms: freezed == apartmentMinRooms ? _self.apartmentMinRooms : apartmentMinRooms // ignore: cast_nullable_to_non_nullable
as int?,apartmentMaxRooms: freezed == apartmentMaxRooms ? _self.apartmentMaxRooms : apartmentMaxRooms // ignore: cast_nullable_to_non_nullable
as int?,apartmentMinBedrooms: freezed == apartmentMinBedrooms ? _self.apartmentMinBedrooms : apartmentMinBedrooms // ignore: cast_nullable_to_non_nullable
as int?,apartmentMinBathrooms: freezed == apartmentMinBathrooms ? _self.apartmentMinBathrooms : apartmentMinBathrooms // ignore: cast_nullable_to_non_nullable
as int?,apartmentFurnishedTypes: freezed == apartmentFurnishedTypes ? _self.apartmentFurnishedTypes : apartmentFurnishedTypes // ignore: cast_nullable_to_non_nullable
as List<FurnishedType>?,apartmentHasAlternativePower: freezed == apartmentHasAlternativePower ? _self.apartmentHasAlternativePower : apartmentHasAlternativePower // ignore: cast_nullable_to_non_nullable
as bool?,apartmentHasGarage: freezed == apartmentHasGarage ? _self.apartmentHasGarage : apartmentHasGarage // ignore: cast_nullable_to_non_nullable
as bool?,apartmentHasFurnished: freezed == apartmentHasFurnished ? _self.apartmentHasFurnished : apartmentHasFurnished // ignore: cast_nullable_to_non_nullable
as bool?,apartmentHasElevator: freezed == apartmentHasElevator ? _self.apartmentHasElevator : apartmentHasElevator // ignore: cast_nullable_to_non_nullable
as bool?,landTypes: freezed == landTypes ? _self.landTypes : landTypes // ignore: cast_nullable_to_non_nullable
as List<LandType>?,landSlops: freezed == landSlops ? _self.landSlops : landSlops // ignore: cast_nullable_to_non_nullable
as List<LandSlop>?,landIsServiced: freezed == landIsServiced ? _self.landIsServiced : landIsServiced // ignore: cast_nullable_to_non_nullable
as bool?,landIsInsideMasterPlan: freezed == landIsInsideMasterPlan ? _self.landIsInsideMasterPlan : landIsInsideMasterPlan // ignore: cast_nullable_to_non_nullable
as bool?,officeMinBathrooms: freezed == officeMinBathrooms ? _self.officeMinBathrooms : officeMinBathrooms // ignore: cast_nullable_to_non_nullable
as int?,officeMinMeetingRooms: freezed == officeMinMeetingRooms ? _self.officeMinMeetingRooms : officeMinMeetingRooms // ignore: cast_nullable_to_non_nullable
as int?,officeHasParking: freezed == officeHasParking ? _self.officeHasParking : officeHasParking // ignore: cast_nullable_to_non_nullable
as bool?,officeIsFurnished: freezed == officeIsFurnished ? _self.officeIsFurnished : officeIsFurnished // ignore: cast_nullable_to_non_nullable
as bool?,shopTypes: freezed == shopTypes ? _self.shopTypes : shopTypes // ignore: cast_nullable_to_non_nullable
as List<ShopType>?,shopHasWarehouse: freezed == shopHasWarehouse ? _self.shopHasWarehouse : shopHasWarehouse // ignore: cast_nullable_to_non_nullable
as bool?,shopHasBathroom: freezed == shopHasBathroom ? _self.shopHasBathroom : shopHasBathroom // ignore: cast_nullable_to_non_nullable
as bool?,shopHasAc: freezed == shopHasAc ? _self.shopHasAc : shopHasAc // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SearchFilterSettings implements SearchFilterSettings {
  const _SearchFilterSettings({@JsonKey(name: "common,Min Price") this.minPrice, @JsonKey(name: "common,Max Price") this.maxPrice, @JsonKey(name: "common,Min Area") this.minArea, @JsonKey(name: "common,Max Area") this.maxArea, @JsonKey(name: "common,Property Type") this.type, @JsonKey(name: "apartment,Min Floor") this.apartmentMinFloor, @JsonKey(name: "apartment,Max Floor") this.apartmentMaxFloor, @JsonKey(name: "apartment,Min Rooms") this.apartmentMinRooms, @JsonKey(name: "apartment,Max Rooms") this.apartmentMaxRooms, @JsonKey(name: "apartment,Min Bedrooms") this.apartmentMinBedrooms, @JsonKey(name: "apartment,Min Bathrooms") this.apartmentMinBathrooms, @JsonKey(name: "apartment,Furniture Type") final  List<FurnishedType>? apartmentFurnishedTypes, @JsonKey(name: "apartment,Has Alternative Power") this.apartmentHasAlternativePower, @JsonKey(name: "apartment,Has Garage") this.apartmentHasGarage, @JsonKey(name: "apartment,Has Furnished") this.apartmentHasFurnished, @JsonKey(name: "apartment,Has Elevator") this.apartmentHasElevator, @JsonKey(name: "land,Land Type") final  List<LandType>? landTypes, @JsonKey(name: "land,Land Slope") final  List<LandSlop>? landSlops, @JsonKey(name: "land,Serviced") this.landIsServiced, @JsonKey(name: "land,Is Inside Master Plan") this.landIsInsideMasterPlan, @JsonKey(name: "office,Min Bathrooms") this.officeMinBathrooms, @JsonKey(name: "office,Min Meeting Rooms") this.officeMinMeetingRooms, @JsonKey(name: "office,Has Parking") this.officeHasParking, @JsonKey(name: "office,Is Furnished") this.officeIsFurnished, @JsonKey(name: "shop,Shop Type") final  List<ShopType>? shopTypes, @JsonKey(name: "shop,Has Warehouse") this.shopHasWarehouse, @JsonKey(name: "shop,Has Bathroom") this.shopHasBathroom, @JsonKey(name: "shop,Has Ac") this.shopHasAc}): _apartmentFurnishedTypes = apartmentFurnishedTypes,_landTypes = landTypes,_landSlops = landSlops,_shopTypes = shopTypes;
  factory _SearchFilterSettings.fromJson(Map<String, dynamic> json) => _$SearchFilterSettingsFromJson(json);

@override@JsonKey(name: "common,Min Price") final  int? minPrice;
@override@JsonKey(name: "common,Max Price") final  int? maxPrice;
@override@JsonKey(name: "common,Min Area") final  int? minArea;
@override@JsonKey(name: "common,Max Area") final  int? maxArea;
@override@JsonKey(name: "common,Property Type") final  PropertableEnum? type;
// apartment
@override@JsonKey(name: "apartment,Min Floor") final  int? apartmentMinFloor;
@override@JsonKey(name: "apartment,Max Floor") final  int? apartmentMaxFloor;
@override@JsonKey(name: "apartment,Min Rooms") final  int? apartmentMinRooms;
@override@JsonKey(name: "apartment,Max Rooms") final  int? apartmentMaxRooms;
@override@JsonKey(name: "apartment,Min Bedrooms") final  int? apartmentMinBedrooms;
@override@JsonKey(name: "apartment,Min Bathrooms") final  int? apartmentMinBathrooms;
 final  List<FurnishedType>? _apartmentFurnishedTypes;
@override@JsonKey(name: "apartment,Furniture Type") List<FurnishedType>? get apartmentFurnishedTypes {
  final value = _apartmentFurnishedTypes;
  if (value == null) return null;
  if (_apartmentFurnishedTypes is EqualUnmodifiableListView) return _apartmentFurnishedTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "apartment,Has Alternative Power") final  bool? apartmentHasAlternativePower;
@override@JsonKey(name: "apartment,Has Garage") final  bool? apartmentHasGarage;
@override@JsonKey(name: "apartment,Has Furnished") final  bool? apartmentHasFurnished;
@override@JsonKey(name: "apartment,Has Elevator") final  bool? apartmentHasElevator;
// land
 final  List<LandType>? _landTypes;
// land
@override@JsonKey(name: "land,Land Type") List<LandType>? get landTypes {
  final value = _landTypes;
  if (value == null) return null;
  if (_landTypes is EqualUnmodifiableListView) return _landTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<LandSlop>? _landSlops;
@override@JsonKey(name: "land,Land Slope") List<LandSlop>? get landSlops {
  final value = _landSlops;
  if (value == null) return null;
  if (_landSlops is EqualUnmodifiableListView) return _landSlops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "land,Serviced") final  bool? landIsServiced;
@override@JsonKey(name: "land,Is Inside Master Plan") final  bool? landIsInsideMasterPlan;
// office
@override@JsonKey(name: "office,Min Bathrooms") final  int? officeMinBathrooms;
@override@JsonKey(name: "office,Min Meeting Rooms") final  int? officeMinMeetingRooms;
@override@JsonKey(name: "office,Has Parking") final  bool? officeHasParking;
@override@JsonKey(name: "office,Is Furnished") final  bool? officeIsFurnished;
// shop
 final  List<ShopType>? _shopTypes;
// shop
@override@JsonKey(name: "shop,Shop Type") List<ShopType>? get shopTypes {
  final value = _shopTypes;
  if (value == null) return null;
  if (_shopTypes is EqualUnmodifiableListView) return _shopTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "shop,Has Warehouse") final  bool? shopHasWarehouse;
@override@JsonKey(name: "shop,Has Bathroom") final  bool? shopHasBathroom;
@override@JsonKey(name: "shop,Has Ac") final  bool? shopHasAc;

/// Create a copy of SearchFilterSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchFilterSettingsCopyWith<_SearchFilterSettings> get copyWith => __$SearchFilterSettingsCopyWithImpl<_SearchFilterSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchFilterSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchFilterSettings&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.minArea, minArea) || other.minArea == minArea)&&(identical(other.maxArea, maxArea) || other.maxArea == maxArea)&&(identical(other.type, type) || other.type == type)&&(identical(other.apartmentMinFloor, apartmentMinFloor) || other.apartmentMinFloor == apartmentMinFloor)&&(identical(other.apartmentMaxFloor, apartmentMaxFloor) || other.apartmentMaxFloor == apartmentMaxFloor)&&(identical(other.apartmentMinRooms, apartmentMinRooms) || other.apartmentMinRooms == apartmentMinRooms)&&(identical(other.apartmentMaxRooms, apartmentMaxRooms) || other.apartmentMaxRooms == apartmentMaxRooms)&&(identical(other.apartmentMinBedrooms, apartmentMinBedrooms) || other.apartmentMinBedrooms == apartmentMinBedrooms)&&(identical(other.apartmentMinBathrooms, apartmentMinBathrooms) || other.apartmentMinBathrooms == apartmentMinBathrooms)&&const DeepCollectionEquality().equals(other._apartmentFurnishedTypes, _apartmentFurnishedTypes)&&(identical(other.apartmentHasAlternativePower, apartmentHasAlternativePower) || other.apartmentHasAlternativePower == apartmentHasAlternativePower)&&(identical(other.apartmentHasGarage, apartmentHasGarage) || other.apartmentHasGarage == apartmentHasGarage)&&(identical(other.apartmentHasFurnished, apartmentHasFurnished) || other.apartmentHasFurnished == apartmentHasFurnished)&&(identical(other.apartmentHasElevator, apartmentHasElevator) || other.apartmentHasElevator == apartmentHasElevator)&&const DeepCollectionEquality().equals(other._landTypes, _landTypes)&&const DeepCollectionEquality().equals(other._landSlops, _landSlops)&&(identical(other.landIsServiced, landIsServiced) || other.landIsServiced == landIsServiced)&&(identical(other.landIsInsideMasterPlan, landIsInsideMasterPlan) || other.landIsInsideMasterPlan == landIsInsideMasterPlan)&&(identical(other.officeMinBathrooms, officeMinBathrooms) || other.officeMinBathrooms == officeMinBathrooms)&&(identical(other.officeMinMeetingRooms, officeMinMeetingRooms) || other.officeMinMeetingRooms == officeMinMeetingRooms)&&(identical(other.officeHasParking, officeHasParking) || other.officeHasParking == officeHasParking)&&(identical(other.officeIsFurnished, officeIsFurnished) || other.officeIsFurnished == officeIsFurnished)&&const DeepCollectionEquality().equals(other._shopTypes, _shopTypes)&&(identical(other.shopHasWarehouse, shopHasWarehouse) || other.shopHasWarehouse == shopHasWarehouse)&&(identical(other.shopHasBathroom, shopHasBathroom) || other.shopHasBathroom == shopHasBathroom)&&(identical(other.shopHasAc, shopHasAc) || other.shopHasAc == shopHasAc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,minPrice,maxPrice,minArea,maxArea,type,apartmentMinFloor,apartmentMaxFloor,apartmentMinRooms,apartmentMaxRooms,apartmentMinBedrooms,apartmentMinBathrooms,const DeepCollectionEquality().hash(_apartmentFurnishedTypes),apartmentHasAlternativePower,apartmentHasGarage,apartmentHasFurnished,apartmentHasElevator,const DeepCollectionEquality().hash(_landTypes),const DeepCollectionEquality().hash(_landSlops),landIsServiced,landIsInsideMasterPlan,officeMinBathrooms,officeMinMeetingRooms,officeHasParking,officeIsFurnished,const DeepCollectionEquality().hash(_shopTypes),shopHasWarehouse,shopHasBathroom,shopHasAc]);

@override
String toString() {
  return 'SearchFilterSettings(minPrice: $minPrice, maxPrice: $maxPrice, minArea: $minArea, maxArea: $maxArea, type: $type, apartmentMinFloor: $apartmentMinFloor, apartmentMaxFloor: $apartmentMaxFloor, apartmentMinRooms: $apartmentMinRooms, apartmentMaxRooms: $apartmentMaxRooms, apartmentMinBedrooms: $apartmentMinBedrooms, apartmentMinBathrooms: $apartmentMinBathrooms, apartmentFurnishedTypes: $apartmentFurnishedTypes, apartmentHasAlternativePower: $apartmentHasAlternativePower, apartmentHasGarage: $apartmentHasGarage, apartmentHasFurnished: $apartmentHasFurnished, apartmentHasElevator: $apartmentHasElevator, landTypes: $landTypes, landSlops: $landSlops, landIsServiced: $landIsServiced, landIsInsideMasterPlan: $landIsInsideMasterPlan, officeMinBathrooms: $officeMinBathrooms, officeMinMeetingRooms: $officeMinMeetingRooms, officeHasParking: $officeHasParking, officeIsFurnished: $officeIsFurnished, shopTypes: $shopTypes, shopHasWarehouse: $shopHasWarehouse, shopHasBathroom: $shopHasBathroom, shopHasAc: $shopHasAc)';
}


}

/// @nodoc
abstract mixin class _$SearchFilterSettingsCopyWith<$Res> implements $SearchFilterSettingsCopyWith<$Res> {
  factory _$SearchFilterSettingsCopyWith(_SearchFilterSettings value, $Res Function(_SearchFilterSettings) _then) = __$SearchFilterSettingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "common,Min Price") int? minPrice,@JsonKey(name: "common,Max Price") int? maxPrice,@JsonKey(name: "common,Min Area") int? minArea,@JsonKey(name: "common,Max Area") int? maxArea,@JsonKey(name: "common,Property Type") PropertableEnum? type,@JsonKey(name: "apartment,Min Floor") int? apartmentMinFloor,@JsonKey(name: "apartment,Max Floor") int? apartmentMaxFloor,@JsonKey(name: "apartment,Min Rooms") int? apartmentMinRooms,@JsonKey(name: "apartment,Max Rooms") int? apartmentMaxRooms,@JsonKey(name: "apartment,Min Bedrooms") int? apartmentMinBedrooms,@JsonKey(name: "apartment,Min Bathrooms") int? apartmentMinBathrooms,@JsonKey(name: "apartment,Furniture Type") List<FurnishedType>? apartmentFurnishedTypes,@JsonKey(name: "apartment,Has Alternative Power") bool? apartmentHasAlternativePower,@JsonKey(name: "apartment,Has Garage") bool? apartmentHasGarage,@JsonKey(name: "apartment,Has Furnished") bool? apartmentHasFurnished,@JsonKey(name: "apartment,Has Elevator") bool? apartmentHasElevator,@JsonKey(name: "land,Land Type") List<LandType>? landTypes,@JsonKey(name: "land,Land Slope") List<LandSlop>? landSlops,@JsonKey(name: "land,Serviced") bool? landIsServiced,@JsonKey(name: "land,Is Inside Master Plan") bool? landIsInsideMasterPlan,@JsonKey(name: "office,Min Bathrooms") int? officeMinBathrooms,@JsonKey(name: "office,Min Meeting Rooms") int? officeMinMeetingRooms,@JsonKey(name: "office,Has Parking") bool? officeHasParking,@JsonKey(name: "office,Is Furnished") bool? officeIsFurnished,@JsonKey(name: "shop,Shop Type") List<ShopType>? shopTypes,@JsonKey(name: "shop,Has Warehouse") bool? shopHasWarehouse,@JsonKey(name: "shop,Has Bathroom") bool? shopHasBathroom,@JsonKey(name: "shop,Has Ac") bool? shopHasAc
});




}
/// @nodoc
class __$SearchFilterSettingsCopyWithImpl<$Res>
    implements _$SearchFilterSettingsCopyWith<$Res> {
  __$SearchFilterSettingsCopyWithImpl(this._self, this._then);

  final _SearchFilterSettings _self;
  final $Res Function(_SearchFilterSettings) _then;

/// Create a copy of SearchFilterSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minPrice = freezed,Object? maxPrice = freezed,Object? minArea = freezed,Object? maxArea = freezed,Object? type = freezed,Object? apartmentMinFloor = freezed,Object? apartmentMaxFloor = freezed,Object? apartmentMinRooms = freezed,Object? apartmentMaxRooms = freezed,Object? apartmentMinBedrooms = freezed,Object? apartmentMinBathrooms = freezed,Object? apartmentFurnishedTypes = freezed,Object? apartmentHasAlternativePower = freezed,Object? apartmentHasGarage = freezed,Object? apartmentHasFurnished = freezed,Object? apartmentHasElevator = freezed,Object? landTypes = freezed,Object? landSlops = freezed,Object? landIsServiced = freezed,Object? landIsInsideMasterPlan = freezed,Object? officeMinBathrooms = freezed,Object? officeMinMeetingRooms = freezed,Object? officeHasParking = freezed,Object? officeIsFurnished = freezed,Object? shopTypes = freezed,Object? shopHasWarehouse = freezed,Object? shopHasBathroom = freezed,Object? shopHasAc = freezed,}) {
  return _then(_SearchFilterSettings(
minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as int?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as int?,minArea: freezed == minArea ? _self.minArea : minArea // ignore: cast_nullable_to_non_nullable
as int?,maxArea: freezed == maxArea ? _self.maxArea : maxArea // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PropertableEnum?,apartmentMinFloor: freezed == apartmentMinFloor ? _self.apartmentMinFloor : apartmentMinFloor // ignore: cast_nullable_to_non_nullable
as int?,apartmentMaxFloor: freezed == apartmentMaxFloor ? _self.apartmentMaxFloor : apartmentMaxFloor // ignore: cast_nullable_to_non_nullable
as int?,apartmentMinRooms: freezed == apartmentMinRooms ? _self.apartmentMinRooms : apartmentMinRooms // ignore: cast_nullable_to_non_nullable
as int?,apartmentMaxRooms: freezed == apartmentMaxRooms ? _self.apartmentMaxRooms : apartmentMaxRooms // ignore: cast_nullable_to_non_nullable
as int?,apartmentMinBedrooms: freezed == apartmentMinBedrooms ? _self.apartmentMinBedrooms : apartmentMinBedrooms // ignore: cast_nullable_to_non_nullable
as int?,apartmentMinBathrooms: freezed == apartmentMinBathrooms ? _self.apartmentMinBathrooms : apartmentMinBathrooms // ignore: cast_nullable_to_non_nullable
as int?,apartmentFurnishedTypes: freezed == apartmentFurnishedTypes ? _self._apartmentFurnishedTypes : apartmentFurnishedTypes // ignore: cast_nullable_to_non_nullable
as List<FurnishedType>?,apartmentHasAlternativePower: freezed == apartmentHasAlternativePower ? _self.apartmentHasAlternativePower : apartmentHasAlternativePower // ignore: cast_nullable_to_non_nullable
as bool?,apartmentHasGarage: freezed == apartmentHasGarage ? _self.apartmentHasGarage : apartmentHasGarage // ignore: cast_nullable_to_non_nullable
as bool?,apartmentHasFurnished: freezed == apartmentHasFurnished ? _self.apartmentHasFurnished : apartmentHasFurnished // ignore: cast_nullable_to_non_nullable
as bool?,apartmentHasElevator: freezed == apartmentHasElevator ? _self.apartmentHasElevator : apartmentHasElevator // ignore: cast_nullable_to_non_nullable
as bool?,landTypes: freezed == landTypes ? _self._landTypes : landTypes // ignore: cast_nullable_to_non_nullable
as List<LandType>?,landSlops: freezed == landSlops ? _self._landSlops : landSlops // ignore: cast_nullable_to_non_nullable
as List<LandSlop>?,landIsServiced: freezed == landIsServiced ? _self.landIsServiced : landIsServiced // ignore: cast_nullable_to_non_nullable
as bool?,landIsInsideMasterPlan: freezed == landIsInsideMasterPlan ? _self.landIsInsideMasterPlan : landIsInsideMasterPlan // ignore: cast_nullable_to_non_nullable
as bool?,officeMinBathrooms: freezed == officeMinBathrooms ? _self.officeMinBathrooms : officeMinBathrooms // ignore: cast_nullable_to_non_nullable
as int?,officeMinMeetingRooms: freezed == officeMinMeetingRooms ? _self.officeMinMeetingRooms : officeMinMeetingRooms // ignore: cast_nullable_to_non_nullable
as int?,officeHasParking: freezed == officeHasParking ? _self.officeHasParking : officeHasParking // ignore: cast_nullable_to_non_nullable
as bool?,officeIsFurnished: freezed == officeIsFurnished ? _self.officeIsFurnished : officeIsFurnished // ignore: cast_nullable_to_non_nullable
as bool?,shopTypes: freezed == shopTypes ? _self._shopTypes : shopTypes // ignore: cast_nullable_to_non_nullable
as List<ShopType>?,shopHasWarehouse: freezed == shopHasWarehouse ? _self.shopHasWarehouse : shopHasWarehouse // ignore: cast_nullable_to_non_nullable
as bool?,shopHasBathroom: freezed == shopHasBathroom ? _self.shopHasBathroom : shopHasBathroom // ignore: cast_nullable_to_non_nullable
as bool?,shopHasAc: freezed == shopHasAc ? _self.shopHasAc : shopHasAc // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
