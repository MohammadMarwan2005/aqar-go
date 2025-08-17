import 'package:aqar_go/domain/model/property.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class AdSecondaryInfo extends StatelessWidget {
  final Propertable propertable;

  const AdSecondaryInfo({super.key, required this.propertable});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return switch (propertable) {
      // Done
      Land land => Column(
        children: [
          IconAndLabel(
            icon: Icon(
              Symbols.landscape,
              color: primaryColor,
            ),
            label:
                "${"Land Type".tr(context)}: ${land.landType.name.tr(context)}",
          ),
          IconAndLabel(
            icon: Icon(
              Symbols.elevation,
              color: primaryColor,
            ),
            label:
                "${"Land Slope".tr(context)}: ${land.landSlop.name.tr(context)}",
          ),
          BooleanCheckFields(
            value: land.isServiced,
            label: "Serviced".tr(context),
          ),
          BooleanCheckFields(
            value: land.isInsideMasterPlan,
            label: "Inside master plan".tr(context),
          ),
        ],
      ),
      // Done
      Office office => Column(
        children: [
          IconAndLabel(
            icon: Icon(
              Icons.vertical_align_top,
              color: primaryColor,
            ),
            label: "${"Floor".tr(context)}: ${office.floor}",
          ),
          IconAndLabel(
            icon: Icon(
              Symbols.nest_multi_room,
              color: primaryColor,
            ),
            label: "${"Rooms".tr(context)}: ${office.rooms}",
          ),
          IconAndLabel(
            icon: Icon(
              Symbols.bathroom,
              color: primaryColor,
            ),
            label: "${"Bathrooms".tr(context)}: ${office.bathrooms}",
          ),
          IconAndLabel(
            icon: Icon(
              Symbols.dine_lamp,
              color: primaryColor,
            ),
            label: "${"Meeting Rooms".tr(context)}: ${office.meetingRooms}",
          ),
          BooleanCheckFields(
            value: office.hasParking,
            label: "yes_has_parking".tr(context),
          ),
          BooleanCheckFields(
            value: office.furnished,
            label: "yes_furnished".tr(context),
          ),
        ],
      ),
      // Done
      Apartment apartment => Column(
        children: [
          IconAndLabel(
            icon: Icon(
              Symbols.nest_multi_room,
              color: primaryColor,
            ),
            label: "${"Rooms".tr(context)}: ${apartment.rooms}",
          ),
          IconAndLabel(
            icon: Icon(
              Symbols.hotel_rounded,
              color: primaryColor,
            ),
            label: "${"Bedrooms".tr(context)}: ${apartment.bedrooms}",
          ),
          IconAndLabel(
            icon: Icon(
              Symbols.bathroom,
              color: primaryColor,
            ),
            label: "${"Bathrooms".tr(context)}: ${apartment.bathrooms}",
          ),
          IconAndLabel(
            icon: Icon(
              Icons.vertical_align_top,
              color: primaryColor,
            ),
            label: "${"Floor".tr(context)}: ${apartment.floor}",
          ),
          IconAndLabel(
            icon: Icon(
              Icons.chair_rounded,
              color: primaryColor,
            ),
            label:
                "${"Furniture Type".tr(context)}: ${apartment.furnishedType.name.tr(context)}",
          ),
          BooleanCheckFields(
            value: apartment.hasElevator,
            label: "yes_has_elevator".tr(context),
          ),
          BooleanCheckFields(
            value: apartment.hasAlternativePower,
            label: "yes_has_alternative_power".tr(context),
          ),
          BooleanCheckFields(
            value: apartment.hasGarage,
            label: "yes_has_garage".tr(context),
          ),
          BooleanCheckFields(
            value: apartment.furnished,
            label: "yes_furnished".tr(context),
          ),
        ],
      ),
      // Done
      Shop shop => Column(
        children: [
          IconAndLabel(
            icon: Icon(
              Icons.category_outlined,
              color: primaryColor,
            ),
            label:
                "${"Shop Type".tr(context)}: ${shop.shopType.name.tr(context)}",
          ),
          IconAndLabel(
            icon: Icon(
              Icons.vertical_align_top,
              color: primaryColor,
            ),
            label: "${"Floor".tr(context)}: ${shop.floor}",
          ),
          BooleanCheckFields(
            value: shop.hasAc,
            label: "yes_has_ac".tr(context),
          ),
          BooleanCheckFields(
            value: shop.hasBathroom,
            label: "yes_has_bathroom".tr(context),
          ),
          BooleanCheckFields(
            value: shop.hasWarehouse,
            label: "yes_has_warehouse".tr(context),
          ),
        ],
      ),
    };
  }
}

class IconAndLabel extends StatelessWidget {
  final Icon icon;
  final String label;

  const IconAndLabel({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(children: [icon, SizedBox(width: 6), Text(label)]),
    );
  }
}

class BooleanCheckFields extends StatelessWidget {
  final bool value;
  final String label;

  const BooleanCheckFields({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return switch (value) {
      false => SizedBox.shrink(),
      true => IconAndLabel(
        icon: Icon(Icons.check_circle, color: Colors.green),
        label: label,
      ),
    };
  }
}
