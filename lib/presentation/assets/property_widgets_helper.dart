import 'package:aqar_go/domain/model/land/land_slop.dart';
import 'package:aqar_go/domain/model/land/land_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/model/apartment/furnished_type.dart';
import '../../domain/model/property.dart';
import '../../domain/model/shop/shop_type.dart';
import '../feature/create_update_post/cubit/create_update_post_cubit.dart';
import '../lang/app_localization.dart';
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

  Widget getFields(BuildContext context, {Widget? spacer}) {
    final cubit = context.read<CreateUpdatePostCubit>();
    final notImplementedYet = Column(
      children: [Text("$labelId is not implemented yet!")],
    );
    switch (this) {
      case PropertableEnum.land:
        return BlocBuilder<CreateUpdatePostCubit, CreateUpdatePostState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SingleSelectFieldWithTitle(
                  title: "Land Type".tr(context),
                  values: LandType.values,
                  selectedValue: state.formData.selectedLandType,
                  onSelect: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(selectedLandType: newValue),
                    );
                  },
                  enumToName: (enu) => enu.name.tr(context),
                ),
                // todo: // single select params: selected enum, its values, enum to string, on select
                // todo: // switch form true false
                _SingleSelectFieldWithTitle(
                  title: "Slope".tr(context),
                  values: LandSlop.values,
                  selectedValue: state.formData.selectedLandSlop,
                  onSelect: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(selectedLandSlop: newValue),
                    );
                  },
                  enumToName: (enu) => enu.name.tr(context),
                ),
                _BooleanFiledWithTitle(
                  title: "Serviced?".tr(context),
                  value: state.formData.isServiced,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(isServiced: newValue),
                    );
                  },
                ),
                _BooleanFiledWithTitle(
                  title: "Inside master plan?".tr(context),
                  value: state.formData.isInsideMasterPlan,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) => currentFormData.copyWith(
                        isInsideMasterPlan: newValue,
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      case PropertableEnum.shop:
        return BlocBuilder<CreateUpdatePostCubit, CreateUpdatePostState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SingleSelectFieldWithTitle(
                  title: "Shop Type".tr(context),
                  values: ShopType.values,
                  selectedValue: state.formData.selectedShopType,
                  onSelect: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(selectedShopType: newValue),
                    );
                  },
                  enumToName: (enu) => enu.name.tr(context),
                ),
                _BooleanFiledWithTitle(
                  title: "Has warehouse?".tr(context),
                  value: state.formData.hasWarehouse,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(hasWarehouse: newValue),
                    );
                  },
                ),
                _BooleanFiledWithTitle(
                  title: "Has bathroom?".tr(context),
                  value: state.formData.hasBathroom,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(hasBathroom: newValue),
                    );
                  },
                ),
                _BooleanFiledWithTitle(
                  title: "Has electrical source?".tr(context),
                  value: state.formData.hasAc,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(hasAc: newValue),
                    );
                  },
                ),
              ],
            );
          },
        );
      case PropertableEnum.office:
        return BlocBuilder<CreateUpdatePostCubit, CreateUpdatePostState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NumberFieldWithTitle(
                  title: "Floor".tr(context),
                  value: state.formData.officeFloor,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(officeFloor: newValue),
                    );
                  },
                ),
                _NumberFieldWithTitle(
                  title: "Rooms".tr(context),
                  value: state.formData.officeRooms,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(officeRooms: newValue),
                    );
                  },
                ),
                _NumberFieldWithTitle(
                  title: "Bathrooms".tr(context),
                  value: state.formData.officeBathrooms,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(officeBathrooms: newValue),
                    );
                  },
                ),
                _NumberFieldWithTitle(
                  title: "Meeting Rooms".tr(context),
                  value: state.formData.meetingRooms,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) => currentFormData.copyWith(
                        meetingRooms: newValue,
                      ),
                    );
                  },
                ),
                _BooleanFiledWithTitle(
                  title: "Has Parking?".tr(context),
                  value: state.formData.hasParking,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(hasParking: newValue),
                    );
                  },
                ),
                _BooleanFiledWithTitle(
                  title: "Furnished?".tr(context),
                  value: state.formData.officeFurnished,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                      (currentFormData) =>
                          currentFormData.copyWith(officeFurnished: newValue),
                    );
                  },
                ),
              ],
            );
          },
        );
      case PropertableEnum.apartment:
        return BlocBuilder<CreateUpdatePostCubit, CreateUpdatePostState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NumberFieldWithTitle(
                  title: "Floor".tr(context),
                  value: state.formData.floor,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                          (currentFormData) => currentFormData.copyWith(floor: newValue),
                    );
                  },
                ),
                _NumberFieldWithTitle(
                  title: "Rooms".tr(context),
                  value: state.formData.apartmentRooms,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                          (currentFormData) => currentFormData.copyWith(apartmentRooms: newValue),
                    );
                  },
                ),
                _NumberFieldWithTitle(
                  title: "Bathrooms".tr(context),
                  value: state.formData.apartmentBathrooms,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                          (currentFormData) => currentFormData.copyWith(apartmentBathrooms: newValue),
                    );
                  },
                ),
                _NumberFieldWithTitle(
                  title: "Bedrooms".tr(context),
                  value: state.formData.apartmentBedrooms,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                          (currentFormData) => currentFormData.copyWith(apartmentBedrooms: newValue),
                    );
                  },
                ),
                _BooleanFiledWithTitle(
                  title: "Has Elevator?".tr(context),
                  value: state.formData.hasElevator,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                          (currentFormData) => currentFormData.copyWith(hasElevator: newValue),
                    );
                  },
                ),
                _BooleanFiledWithTitle(
                  title: "Has Alternative Power?".tr(context),
                  value: state.formData.hasAlternativePower,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                          (currentFormData) => currentFormData.copyWith(hasAlternativePower: newValue),
                    );
                  },
                ),
                _BooleanFiledWithTitle(
                  title: "Has Garage?".tr(context),
                  value: state.formData.hasGarage,
                  onChanged: (newValue) {
                    cubit.updateFormData(
                          (currentFormData) => currentFormData.copyWith(hasGarage: newValue),
                    );
                  },
                ),
                // todo: FurnishedType.values
                _SingleSelectFieldWithTitle(
                  title: "Furnished Type".tr(context),
                  values: FurnishedType.values,
                  selectedValue: state.formData.apartmentFurnishedType,
                  onSelect: (newValue) {
                    cubit.updateFormData(
                          (currentFormData) => currentFormData.copyWith(apartmentFurnishedType: newValue),
                    );
                  },
                  enumToName: (enu) => enu.name,
                ),
              ],
            );
          },
        );
    }
  }
}

class _SingleSelectFieldWithTitle<T> extends StatelessWidget {
  final String title;
  final Widget? spacer;
  final T selectedValue;
  final List<T> values;
  final String Function(T enu) enumToName;
  final void Function(T newValue) onSelect;

  const _SingleSelectFieldWithTitle({
    super.key,
    required this.selectedValue,
    required this.values,
    required this.enumToName,
    required this.onSelect,
    required this.title,
    this.spacer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        spacer ?? SizedBox(height: 4),
        SingleSelectField(
          selectedValue: selectedValue,
          values: values,
          enumToName: enumToName,
          onSelect: onSelect,
        ),
      ],
    );
  }
}

class SingleSelectField<T> extends StatelessWidget {
  final T selectedValue;
  final List<T> values;
  final String Function(T enu) enumToName;
  final void Function(T newValue) onSelect;

  const SingleSelectField({
    super.key,
    required this.selectedValue,
    required this.values,
    required this.enumToName,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            values.map((e) {
              final isSelected = e == selectedValue;
              final contentColor =
                  isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Text(enumToName(e)),
                  selected: isSelected,
                  onSelected: (_) => onSelect(e),
                  selectedColor: Theme.of(context).colorScheme.primary,
                  labelStyle: TextStyle(color: contentColor),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class _BooleanFiledWithTitle extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool newValue) onChanged;

  const _BooleanFiledWithTitle({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 4),
        BooleanField(value: value, onChanged: onChanged),
      ],
    );
  }
}

class BooleanField extends StatelessWidget {
  final bool value;
  final void Function(bool newValue) onChanged;
  final String? trueLabel;
  final String? falseLabel;

  const BooleanField({
    super.key,
    required this.value,
    required this.onChanged,
    this.trueLabel,
    this.falseLabel,
  });

  @override
  Widget build(BuildContext context) {
    final yesContentColor =
        value
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSurface;

    final noContentColor =
        !value
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSurface;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(trueLabel ?? "Yes".tr(context)),
              selected: value,
              onSelected: (_) {
                onChanged(true);
              },
              selectedColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(color: yesContentColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(falseLabel ?? "No".tr(context)),
              selected: !value,
              onSelected: (_) {
                onChanged(false);
              },
              selectedColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(color: noContentColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _NumberFieldWithTitle extends StatelessWidget {
  final String title;
  final int? value;
  final void Function(int? newValue) onChanged;
  final bool isNullable; // Add this to control whether to show "None" chip

  const _NumberFieldWithTitle({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.isNullable = false, // Default is false
  });

  @override
  Widget build(BuildContext context) {
    // List of values for the chips (from 0 to 5)
    final numberChips = List.generate(6, (index) => index);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 4),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Conditionally show "None" chip for nullable fields
              if (isNullable)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text("None".tr(context)),
                    selected: value == null,
                    onSelected: (_) {
                      onChanged(null);
                    },
                    selectedColor: Theme.of(context).colorScheme.primary,
                    labelStyle: TextStyle(
                      color:
                          value == null
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              // Chips for numbers 0 to 5
              ...numberChips.map((num) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(num.toString()),
                    selected: value == num,
                    onSelected: (_) {
                      onChanged(num);
                    },
                    selectedColor: Theme.of(context).colorScheme.primary,
                    labelStyle: TextStyle(
                      color:
                          value == num
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
