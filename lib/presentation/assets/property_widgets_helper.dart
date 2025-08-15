import '../../domain/model/property.dart';
import 'assets.gen.dart';

extension X on PropertableEnum {
  SvgGenImage getIcon() {
    switch (this) {
      case PropertableEnum.land:
        return Assets.svgs.land;
      case PropertableEnum.shop:
        return Assets.svgs.shop;
      case PropertableEnum.office:
        return Assets.svgs.office;
      case PropertableEnum.apartment:
        return Assets.svgs.apartment;
    }
  }
}
