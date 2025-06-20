// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:aqar_go/domain/model/shop/shop_type.dart';
// import 'package:aqar_go/domain/model/land/land_slop.dart';
// import 'package:aqar_go/domain/model/land/land_type.dart';
//
// class CreatePropertyRequest {
//   final String type;
//   final PropertableData data;
//   final PropertyDataWrapper property;
//
//   CreatePropertyRequest({
//     required this.type,
//     required this.data,
//     required this.property,
//   });
//
//   FormData toFormData() {
//     final formMap = <String, dynamic>{
//       'type': type,
//       ...data.toFormMap(),
//       ...property.toFormMap(),
//     };
//     return FormData.fromMap(formMap);
//   }
//
//
//
// }
//
// abstract class PropertableData {
//   Map<String, dynamic> toFormMap();
// }
//
// class ShopDataRequest extends PropertableData {
//   final int floor;
//   final ShopType shopType;
//   final bool hasWarehouse;
//   final bool hasBathroom;
//   final bool hasAc;
//
//   ShopDataRequest({
//     required this.floor,
//     required this.shopType,
//     required this.hasWarehouse,
//     required this.hasBathroom,
//     required this.hasAc,
//   });
//
//   @override
//   Map<String, dynamic> toFormMap() {
//     return {
//       'data[floor]': floor,
//       'data[type]': shopType.name,
//       'data[has_warehouse]': hasWarehouse ? 1 : 0,
//       'data[has_bathroom]': hasBathroom ? 1 : 0,
//       'data[has_ac]': hasAc ? 1 : 0,
//     };
//   }
// }
//
// class LandDataRequest extends PropertableData {
//   final LandType landType;
//   final LandSlop landSlop;
//   final bool isServiced;
//   final bool isInsideMasterPlan;
//
//   LandDataRequest({
//     required this.landType,
//     required this.landSlop,
//     required this.isServiced,
//     required this.isInsideMasterPlan,
//   });
//
//   @override
//   Map<String, dynamic> toFormMap() {
//     return {
//       'data[type]': landType.name,
//       'data[slope]': landSlop.name,
//       'data[is_serviced]': isServiced ? 1 : 0,
//       'data[is_inside_master_plan]': isInsideMasterPlan ? 1 : 0,
//     };
//   }
// }
//
// class PropertyDataWrapper {
//   final int locationId;
//   final int area;
//   final String description;
//   final int price;
//   final String title;
//   final List<File> images;
//
//   PropertyDataWrapper({
//     required this.locationId,
//     required this.area,
//     required this.description,
//     required this.price,
//     required this.title,
//     required this.images,
//   });
//
//   Map<String, dynamic> toFormMap() {
//     final map = <String, dynamic>{
//       'property[location_id]': locationId,
//       'property[area]': area,
//       'property[description]': description,
//       'property[price]': price,
//       'property[name]': title,
//     };
//
//     for (int i = 0; i < images.length; i++) {
//       map['property[image][$i]'] = MultipartFile.fromFileSync(images[i].path, filename: images[i].uri.pathSegments.last);
//     }
//
//     return map;
//   }
// }
//






import 'package:aqar_go/domain/model/property.dart';
import 'package:dio/dio.dart';

import '../../../common/helpers/logging_helper.dart';
import '../property/property_data.dart';

extension CreatePropertyRequest on Property {
  Future<FormData> asFormData() async {
    final Map<String, dynamic> formMap = {'type': propertable.toEnum().labelId};
    final propertableMap = PropertyData.fromDomain(this).propertable;
    (propertableMap).forEach((key, value) {
      var finalValue = value.toString();
      // todo: remove those
      if(finalValue == "true") finalValue = "1";
      if(finalValue == "false") finalValue = "0";
      debugLog('"data[$key]" : ${finalValue.toString()}');
      formMap['data[$key]'] = finalValue;
    });

    formMap['property[location_id]'] = locationId.toString();
    formMap['property[area]'] = area.toString();
    formMap['property[description]'] = description;
    formMap['property[price]'] = price.toString();
    formMap['property[name]'] = title;


    for (final imageFile in images) {
      if(imageFile.path != null) {
        final path = await MultipartFile.fromFile(imageFile.path!);
        formMap.putIfAbsent('property[image][]', () => path);
      }
    }
    return FormData.fromMap(formMap);
  }

  // Future<FormData> toFormData() async {
  //   final Map<String, dynamic> formMap = {'type': type};
  //
  //   debugLog("DataType${data.runtimeType}");
  //   final propertableJsonData = data.toJson();
  //   debugLog("DataType.toJson():  $propertableJsonData");
  //   (propertableJsonData).forEach((key, value) {
  //     var finalValue = value.toString();
  //     if(finalValue == "true") finalValue = "1";
  //     if(finalValue == "false") finalValue = "0";
  //     debugLog('"data[$key]" : ${finalValue.toString()}');
  //     formMap['data[$key]'] = finalValue;
  //   });
  //
  //   // Flatten `property`
  //   formMap['property[location_id]'] = property.locationId.toString();
  //   formMap['property[area]'] = property.area.toString();
  //   formMap['property[description]'] = property.description;
  //   formMap['property[price]'] = property.price.toString();
  //   formMap['property[name]'] = property.title;
  //
  //   // Handle images (if any)
  //   if (property.images != null) {
  //     for (final imageFile in property.images!) {
  //       final path = await MultipartFile.fromFile(imageFile.path);
  //       formMap.putIfAbsent('property[image][]', () => path);
  //     }
  //   }
  //
  //   return FormData.fromMap(formMap);
  // }
}