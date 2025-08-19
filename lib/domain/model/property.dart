import 'package:aqar_go/domain/model/shop/shop_type.dart';

import 'apartment/furnished_type.dart';
import 'land/land_slop.dart';
import 'land/land_type.dart';
import 'media_file.dart';
import 'profile/user_profile.dart';

part 'land/land.dart';
part 'office/office.dart';
part 'apartment/apartment.dart';

part 'shop/shop.dart';

class Property {
  final String title;
  final String description;
  final int price;
  final int area;
  final List<MediaFile> images;
  final double lat;
  final double long;
  final String addressName;

  // you will not use in create
  final int id;
  final int userId;
  final int propertableId;
  final UserProfile? userProfile;

  final bool isAd;

  final Propertable propertable;

  Property({
    required this.id,
    required this.userId,
    required this.long,
    required this.lat,
    required this.addressName,
    required this.propertableId,
    required this.area,
    required this.price,
    required this.title,
    required this.description,
    required this.propertable,
    required this.images,
    required this.isAd,
    this.userProfile
  });
}

sealed class Propertable {
  PropertableEnum toEnum();
}

enum PropertableEnum {
  land("Land"),
  shop("Shop"),
  office("Office"),
  apartment("Apartment");
  // // todo later: add more...

  final String labelId;

  const PropertableEnum(this.labelId);
}
