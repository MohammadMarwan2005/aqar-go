import 'package:equatable/equatable.dart';
import 'package:aqar_go/domain/model/property.dart';
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
  });

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
  }) {
    return PostFormData(
      title: title ?? this.title,
      description: description ?? this.description,
      area: area ?? this.area,
      price: price ?? this.price,
      locationId: locationId ?? this.locationId,
      selectedPropertableEnum:
          selectedPropertableEnum ?? this.selectedPropertableEnum,
      floor: floor ?? this.floor,
      selectedShopType: selectedShopType ?? this.selectedShopType,
      hasWarehouse: hasWarehouse ?? this.hasWarehouse,
      hasBathroom: hasBathroom ?? this.hasBathroom,
      hasAc: hasAc ?? this.hasAc,
      selectedLandType: selectedLandType ?? this.selectedLandType,
      selectedLandSlop: selectedLandSlop ?? this.selectedLandSlop,
      isServiced: isServiced ?? this.isServiced,
      isInsideMasterPlan: isInsideMasterPlan ?? this.isInsideMasterPlan,
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
    }
  }
}
