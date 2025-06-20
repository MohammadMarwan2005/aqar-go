import 'package:aqar_go/domain/model/shop/shop_type.dart';

import 'land/land_slop.dart';
import 'land/land_type.dart';
import 'media_file.dart';

part 'land/land.dart';

part 'shop/shop.dart';

class Property {
  final String title;
  final String description;
  final int price;
  final int area;
  final List<MediaFile> images;
  final int locationId;

  // you will not use in create
  final int id;
  final int userId;
  final int propertableId;

  final Propertable propertable;

  Property({
    required this.id,
    required this.userId,
    required this.locationId,
    required this.propertableId,
    required this.area,
    required this.price,
    required this.title,
    required this.description,
    required this.propertable,
    required this.images
  });
}

sealed class Propertable {
  PropertableEnum toEnum();
}

enum PropertableEnum {
  land("Land"),
  shop("Shop");
  // office("Office"),
  // apartment("Apartment")
  // // todo later: add more...

  final String labelId;

  const PropertableEnum(this.labelId);
}
