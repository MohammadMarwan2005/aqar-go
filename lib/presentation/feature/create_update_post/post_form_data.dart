import 'package:equatable/equatable.dart';
import 'package:aqar_go/domain/model/property.dart';
import '../../../domain/model/apartment/furnished_type.dart';
import '../../../domain/model/land/land_slop.dart';
import '../../../domain/model/land/land_type.dart';
import '../../../domain/model/shop/shop_type.dart';

class PostFormData extends Equatable {
  final String title;
  final String description;
  final String area;
  final String price;
  final int? locationId;
  final PropertableEnum selectedPropertableEnum;

  // Shop
  final int floor;
  final ShopType selectedShopType;
  final bool hasWarehouse;
  final bool hasBathroom;
  final bool hasAc;

  // Land
  final LandType selectedLandType;
  final LandSlop selectedLandSlop;
  final bool isServiced;
  final bool isInsideMasterPlan;

  // Office
  final int officeFloor;
  final int officeRooms;
  final int officeBathrooms;
  final int meetingRooms;
  final bool hasParking;
  final bool officeFurnished;

  // Apartment
  final int apartmentFloor;
  final int apartmentRooms;
  final int apartmentBathrooms;
  final int apartmentBedrooms;
  final bool hasElevator;
  final bool hasAlternativePower;
  final bool hasGarage;
  final bool apartmentFurnished;
  final FurnishedType apartmentFurnishedType;

  const PostFormData({
    this.title = 'some title',
    this.description = 'some desc',
    this.area = '22',
    this.price = '22',
    this.locationId = 1,
    this.selectedPropertableEnum = PropertableEnum.land,
    this.floor = 0,
    this.selectedShopType = ShopType.retail,
    this.hasWarehouse = false,
    this.hasBathroom = false,
    this.hasAc = false,
    this.selectedLandType = LandType.agricultural,
    this.selectedLandSlop = LandSlop.flat,
    this.isServiced = false,
    this.isInsideMasterPlan = false,

    // Office fields
    this.officeFloor = 0,
    this.officeRooms = 0,
    this.officeBathrooms = 0,
    this.meetingRooms = 0,
    this.hasParking = false,
    this.officeFurnished = false,
    // Apartment fields
    this.apartmentFloor = 0,
    this.apartmentRooms = 0,
    this.apartmentBathrooms = 0,
    this.apartmentBedrooms = 0,
    this.hasElevator = false,
    this.hasAlternativePower = false,
    this.hasGarage = false,
    this.apartmentFurnished = false,
    this.apartmentFurnishedType = FurnishedType.standard,
  });

  factory PostFormData.fromProperty(Property? property) {
    if (property == null) return PostFormData();

    final propertable = property.propertable;

    PropertableEnum selectedPropertableEnum = propertable.toEnum();
    int floor = 0;
    ShopType selectedShopType = ShopType.retail;
    bool hasWarehouse = false;
    bool hasBathroom = false;
    bool hasAc = false;
    LandType selectedLandType = LandType.agricultural;
    LandSlop selectedLandSlop = LandSlop.flat;
    bool isServiced = false;
    bool isInsideMasterPlan = false;
    int officeFloor = 0;
    int officeRooms = 0;
    int officeBathrooms = 0;
    int meetingRooms = 0;
    bool hasParking = false;
    bool officeFurnished = false;
    int apartmentFloor = 0;
    int apartmentRooms = 0;
    int apartmentBathrooms = 0;
    int apartmentBedrooms = 0;
    bool hasElevator = false;
    bool hasAlternativePower = false;
    bool hasGarage = false;
    bool apartmentFurnished = false;
    FurnishedType apartmentFurnishedType = FurnishedType.standard;

    switch (selectedPropertableEnum) {
      case PropertableEnum.land:
        {
          propertable as Land;
          selectedPropertableEnum = PropertableEnum.land;
          selectedLandType = propertable.landType;
          selectedLandSlop = propertable.landSlop;
          isServiced = propertable.isServiced;
          isInsideMasterPlan = propertable.isInsideMasterPlan;
        }
        break;
      case PropertableEnum.shop:
        {
          propertable as Shop;
          floor = propertable.floor;
          selectedShopType = propertable.shopType;
          hasWarehouse = propertable.hasWarehouse;
          hasBathroom = propertable.hasBathroom;
          hasAc = propertable.hasAc;
        }
        break;
      case PropertableEnum.office:
        {
          propertable as Office;
          officeFloor = propertable.floor;
          officeRooms = propertable.rooms;
          officeBathrooms = propertable.bathrooms;
          meetingRooms = propertable.meetingRooms;
          hasParking = propertable.hasParking;
          officeFurnished = propertable.furnished;
        }
        break;
      case PropertableEnum.apartment:
        {
          propertable as Apartment;
          apartmentFloor = propertable.floor;
          apartmentRooms = propertable.rooms;
          apartmentBathrooms = propertable.bathrooms;
          apartmentBedrooms = propertable.bedrooms;
          hasElevator = propertable.hasElevator;
          hasAlternativePower = propertable.hasAlternativePower;
          hasGarage = propertable.hasGarage;
          apartmentFurnished = propertable.furnished;
          apartmentFurnishedType = propertable.furnishedType;
        }
        break;
    }

    return PostFormData(
      title: property.title,
      description: property.description,
      area: property.area.toString(),
      price: property.price.toString(),
      locationId: property.locationId,
      selectedPropertableEnum: selectedPropertableEnum,
      floor: floor,
      selectedShopType: selectedShopType,
      hasWarehouse: hasWarehouse,
      hasBathroom: hasBathroom,
      hasAc: hasAc,
      selectedLandType: selectedLandType,
      selectedLandSlop: selectedLandSlop,
      isServiced: isServiced,
      isInsideMasterPlan: isInsideMasterPlan,
      // Office fields
      officeFloor: officeFloor,
      officeRooms: officeRooms,
      officeBathrooms: officeBathrooms,
      meetingRooms: meetingRooms,
      hasParking: hasParking,
      officeFurnished: officeFurnished,
      // Apartment fields
      apartmentFloor: apartmentFloor,
      apartmentRooms: apartmentRooms,
      apartmentBathrooms: apartmentBathrooms,
      apartmentBedrooms: apartmentBedrooms,
      hasElevator: hasElevator,
      hasAlternativePower: hasAlternativePower,
      hasGarage: hasGarage,
      apartmentFurnished: apartmentFurnished,
      apartmentFurnishedType: apartmentFurnishedType,
    );
  }

  PostFormData copyWith({
    String? title,
    String? description,
    String? area,
    String? price,
    int? locationId,
    PropertableEnum? selectedPropertableEnum,
    int? floor,
    ShopType? selectedShopType,
    bool? hasWarehouse,
    bool? hasBathroom,
    bool? hasAc,
    LandType? selectedLandType,
    LandSlop? selectedLandSlop,
    bool? isServiced,
    bool? isInsideMasterPlan,
    int? officeFloor,
    int? officeRooms,
    int? officeBathrooms,
    int? meetingRooms,
    bool? hasParking,
    bool? officeFurnished,
    int? apartmentFloor,
    int? apartmentRooms,
    int? apartmentBathrooms,
    int? apartmentBedrooms,
    bool? hasElevator,
    bool? hasAlternativePower,
    bool? hasGarage,
    bool? apartmentFurnished,
    FurnishedType? apartmentFurnishedType,
    bool enforceValue = false,
  }) {
    return PostFormData(
      title: title ?? this.title,
      description: description ?? this.description,
      area: area ?? this.area,
      price: price ?? this.price,
      locationId: locationId ?? this.locationId,
      selectedPropertableEnum: selectedPropertableEnum ?? this.selectedPropertableEnum,
      floor: floor ?? this.floor,
      selectedShopType: selectedShopType ?? this.selectedShopType,
      hasWarehouse: hasWarehouse ?? this.hasWarehouse,
      hasBathroom: hasBathroom ?? this.hasBathroom,
      hasAc: hasAc ?? this.hasAc,
      selectedLandType: selectedLandType ?? this.selectedLandType,
      selectedLandSlop: selectedLandSlop ?? this.selectedLandSlop,
      isServiced: isServiced ?? this.isServiced,
      isInsideMasterPlan: isInsideMasterPlan ?? this.isInsideMasterPlan,
      // Office fields
      officeFloor: officeFloor ?? this.officeFloor,
      officeRooms: officeRooms ?? this.officeRooms,
      officeBathrooms: officeBathrooms ?? this.officeBathrooms,
      hasParking: hasParking ?? this.hasParking,
      officeFurnished: officeFurnished ?? this.officeFurnished,
      meetingRooms: meetingRooms ?? this.meetingRooms,
      // Apartment fields
      apartmentFloor: apartmentFloor ?? this.apartmentFloor,
      apartmentRooms: apartmentRooms ?? this.apartmentRooms,
      apartmentBathrooms: apartmentBathrooms ?? this.apartmentBathrooms,
      apartmentBedrooms: apartmentBedrooms ?? this.apartmentBedrooms,
      hasElevator: hasElevator ?? this.hasElevator,
      hasAlternativePower: hasAlternativePower ?? this.hasAlternativePower,
      hasGarage: hasGarage ?? this.hasGarage,
      apartmentFurnished: apartmentFurnished ?? this.apartmentFurnished,
      apartmentFurnishedType: apartmentFurnishedType ?? this.apartmentFurnishedType,
    );
  }

  @override
  List<Object?> get props => [
    title,
    description,
    area,
    price,
    locationId,
    selectedPropertableEnum,
    floor,
    selectedShopType,
    hasWarehouse,
    hasBathroom,
    hasAc,
    selectedLandType,
    selectedLandSlop,
    isServiced,
    isInsideMasterPlan,
    officeFloor,
    officeRooms,
    officeBathrooms,
    meetingRooms,
    hasParking,
    officeFurnished,
    apartmentFloor,
    apartmentRooms,
    apartmentBathrooms,
    apartmentBedrooms,
    hasElevator,
    hasAlternativePower,
    hasGarage,
    apartmentFurnished,
    apartmentFurnishedType,
  ];

  Propertable getPropertable() {
    switch (selectedPropertableEnum) {
      case PropertableEnum.land:
        return Land(
          isServiced: isServiced,
          landType: selectedLandType,
          isInsideMasterPlan: isInsideMasterPlan,
          landSlop: selectedLandSlop,
        );
      case PropertableEnum.shop:
        return Shop(
          floor: floor,
          shopType: selectedShopType,
          hasWarehouse: hasWarehouse,
          hasBathroom: hasBathroom,
          hasAc: hasAc,
        );
      case PropertableEnum.office:
        return Office(
          floor: officeFloor,
          rooms: officeRooms,
          bathrooms: officeBathrooms,
          meetingRooms: meetingRooms,
          hasParking: hasParking,
          furnished: officeFurnished,
        );
      case PropertableEnum.apartment:
        return Apartment(
          floor: apartmentFloor,
          rooms: apartmentRooms,
          bathrooms: apartmentBathrooms,
          bedrooms: apartmentBedrooms,
          hasElevator: hasElevator,
          hasAlternativePower: hasAlternativePower,
          hasGarage: hasGarage,
          furnished: apartmentFurnished,
          furnishedType: apartmentFurnishedType,
        );
    }
  }
}
