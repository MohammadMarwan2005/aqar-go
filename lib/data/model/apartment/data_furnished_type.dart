import '../../../domain/model/apartment/furnished_type.dart';

enum DataFurnishedType {
  economic("economic"),
  standard("standard"),
  deluxe("delux"),
  superDeluxe("super_delux"),
  luxury("luxury"),
  invalid("invalid");

  final String backendValue;

  const DataFurnishedType(this.backendValue);

  static DataFurnishedType fromString(String type) {
    return DataFurnishedType.values.firstWhere(
      (element) => element.backendValue == type,
      orElse: () => DataFurnishedType.invalid,
    );
  }

  FurnishedType toDomain() {
    switch (this) {
      case DataFurnishedType.economic:
        return FurnishedType.economic;
      case DataFurnishedType.standard:
        return FurnishedType.standard;
      case DataFurnishedType.deluxe:
        return FurnishedType.deluxe;
      case DataFurnishedType.superDeluxe:
        return FurnishedType.superDeluxe;
      case DataFurnishedType.luxury:
        return FurnishedType.luxury;
      case DataFurnishedType.invalid:
        return FurnishedType.economic;
    }
  }

  static DataFurnishedType fromDomain(FurnishedType type) {
    switch (type) {
      case FurnishedType.economic:
        return DataFurnishedType.economic;
      case FurnishedType.standard:
        return DataFurnishedType.standard;
      case FurnishedType.deluxe:
        return DataFurnishedType.deluxe;
      case FurnishedType.superDeluxe:
        return DataFurnishedType.superDeluxe;
      case FurnishedType.luxury:
        return DataFurnishedType.luxury;
    }
  }
}
