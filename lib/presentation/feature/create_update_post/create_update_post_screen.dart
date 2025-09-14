import 'package:aqar_go/common/helpers/validation_helper.dart';
import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/model/land/land_slop.dart';
import 'package:aqar_go/domain/model/land/land_type.dart';
import 'package:aqar_go/domain/model/property.dart';
import 'package:aqar_go/presentation/assets/property_widgets_helper.dart';
import 'package:aqar_go/presentation/feature/create_update_post/cubit/create_update_post_cubit.dart';
import 'package:aqar_go/presentation/feature/maps/cubit/maps_cubit.dart';
import 'package:aqar_go/presentation/feature/media_picker/image_picker_widget.dart';
import 'package:aqar_go/presentation/feature/media_picker/media_picker_cubit.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/app_text_field.dart';
import 'package:aqar_go/presentation/widgets/screen_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/apartment/furnished_type.dart';
import '../../../domain/model/shop/shop_type.dart';
import '../../widgets/boolean_field_with_title.dart';
import '../../widgets/number_field_with_value.dart';
import '../../widgets/single_select_field_with_title.dart';
import '../maps/map_selector.dart';
import '../my_properties/cubit/my_properties_cubit.dart';

class CreateUpdatePostScreen extends StatelessWidget {
  const CreateUpdatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateUpdatePostCubit>();
    return BlocConsumer<CreateUpdatePostCubit, CreateUpdatePostState>(
      listener: (context, state) {
        switch (state) {
          case CreateUpdatePostInitial():
            return;
          case CreateUpdatePostLoading():
            return;
          case CreateAdLoading():
            return;
          case CreateUpdatePostSuccess():
            if (cubit.isUpdate) {
              context.read<MyPropertiesCubit>().resetState();
            }
            context.showMySnackBar(
              "Property uploaded successfully!".tr(context),
            );
            context.popRoute();
            return;
          case CreateAdSuccess():
            if (cubit.isUpdate) {
              context.read<MyPropertiesCubit>().resetState();
            }
            context.showMySnackBar("Ad created successfully!".tr(context));
            context.popRoute();
          case CreateUpdatePostError(
            error: final error,
            isSnackBar: final isSnackBar,
          ):
            if (isSnackBar) {
              context.showMySnackBar(error.getMessage(context));
            } else {
              context.showMyAlertDialogFromDomainError(error);
            }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.isUpdate
                  ? "Update Property".tr(context)
                  : "Create New Property".tr(context),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: ScreenPadding(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // property stuff:
                      _PropertyFields(cubit: cubit, state: state),
                      _LocalSizedBox(),
                      PropertableSelector(
                        selectedType: state.formData.selectedPropertableEnum,
                        onSelect: (newValue) {
                          cubit.updateFormData((currentFormData) {
                            return currentFormData.copyWith(
                              selectedPropertableEnum: newValue,
                            );
                          });
                        },
                      ),
                      _LocalSizedBox(),
                      _PropertableFields(cubit: cubit, state: state),
                      SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppButton(
                              isSecondary: cubit.isUpdate ? true : false,
                              isLoading: state is CreateUpdatePostLoading,
                              onPressed: () {
                                final images = context.read<MediaPickerCubit>().state.files;
                                final mapsState = context.read<MapsCubit>().state;
                                final long = mapsState.selectedMarker?.position.longitude;
                                final late = mapsState.selectedMarker?.position.latitude;
                                debugPrint("$long , $late");

                                final toDeleteImagesIds =
                                    context
                                        .read<MediaPickerCubit>()
                                        .state
                                        .toDeleteImagesIds;
                                cubit.createOrUpdatePost(
                                  images,
                                  toDeleteImagesIds,
                                  long,
                                  late,
                                );
                              },
                              text:
                              cubit.isUpdate
                                  ? "Update Property".tr(context)
                                  : "Create Property".tr(context),
                            ),
                            if (cubit.isUpdate && cubit.property?.isAd == false) ...[
                              SizedBox(height: 8),
                              AppButton(
                                isLoading: state is CreateAdLoading,
                                onPressed: () {
                                  cubit.createAd();
                                },
                                text: "Post Ad".tr(context),
                              ),
                            ],
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PropertyFields extends StatelessWidget {
  final CreateUpdatePostCubit cubit;
  final CreateUpdatePostState state;

  const _PropertyFields({super.key, required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImagePickerWidget(titleId: "Images"),
        _LocalSizedBox(),
        // do the same like this...:
        AppTextField(
          initialValue: state.formData.title,
          onChanged: (value) {
            cubit.updateFormData(
              (currentFormData) => currentFormData.copyWith(title: value),
            );
          },
          validator: (value) => value.validateNotEmpty()?.tr(context),
          labelText: "Title".tr(context),
        ),
        _LocalSizedBox(),
        AppTextField(
          initialValue: state.formData.description,
          onChanged: (value) {
            cubit.updateFormData(
              (current) => current.copyWith(description: value),
            );
          },
          validator: (value) => value.validateNotEmpty()?.tr(context),
          labelText: "Description".tr(context),
        ),
        _LocalSizedBox(),
        AppTextField(
          initialValue: state.formData.price,
          onChanged: (value) {
            cubit.updateFormData((current) => current.copyWith(price: value));
          },
          labelText: "Price".tr(context),
          validator: (value) => value.validatePrice()?.tr(context),
          keyboardType: TextInputType.number,
        ),
        _LocalSizedBox(),
        AppTextField(
          initialValue: state.formData.area,
          onChanged: (value) {
            cubit.updateFormData((current) => current.copyWith(area: value));
          },
          labelText: "Area in m^2".tr(context),
          validator: (value) => value.validateArea()?.tr(context),
          keyboardType: TextInputType.number,
        ),
        _LocalSizedBox(),
        AppTextField(
          initialValue: state.formData.addressName.toString(),
          onChanged: (value) {
            cubit.updateFormData(
              (current) => current.copyWith(addressName: value),
            );
          },
          labelText: "Address".tr(context),
          validator: (value) => value.validateNotEmpty()?.tr(context),
        ),
        _LocalSizedBox(),
        MapSelector(
          initialLong: cubit.property?.long,
          initialLat: cubit.property?.lat,
        ),
        _LocalSizedBox(),
      ],
    );
  }
}

class _LocalSizedBox extends StatelessWidget {
  const _LocalSizedBox();

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 16);
  }
}

class PropertableSelector extends StatelessWidget {
  final PropertableEnum? selectedType;
  final void Function(PropertableEnum newValue) onSelect;

  const PropertableSelector({
    super.key,
    required this.selectedType,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            PropertableEnum.values.map((e) {
              final isSelected = e == selectedType;

              final backgroundColor =
                  isSelected
                      ? Theme.of(context).colorScheme.inversePrimary
                      : Theme.of(
                        context,
                      ).colorScheme.inversePrimary.withOpacity(0.35);
              final borderColor =
                  isSelected ? colorScheme.primary : Colors.transparent;

              final iconTextColor =
                  isSelected ? colorScheme.primary : colorScheme.onSurface;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: InkWell(
                  onTap: () => onSelect(e),
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 80,
                      minHeight: 80,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: borderColor, width: 2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        e.getIcon().svg(
                          width: 32,
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            iconTextColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          e.labelId.tr(context),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: iconTextColor,
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class _PropertableFields extends StatelessWidget {
  final CreateUpdatePostCubit cubit;
  final CreateUpdatePostState state;

  const _PropertableFields({required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateUpdatePostCubit>();
    switch (state.formData.selectedPropertableEnum) {
      case PropertableEnum.land:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectFieldWithTitle(
              title: "Land Type".tr(context),
              values: LandType.values,
              selectedValues: [state.formData.selectedLandType],
              onSelect: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(selectedLandType: newValue),
                );
              },
              enumToName: (enu) => enu.name.tr(context),
            ),
            SelectFieldWithTitle(
              title: "Slope".tr(context),
              values: LandSlop.values,
              selectedValues: [state.formData.selectedLandSlop],
              onSelect: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(selectedLandSlop: newValue),
                );
              },
              enumToName: (enu) => enu.name.tr(context),
            ),
            BooleanFiledWithTitle(
              title: "Serviced?".tr(context),
              value: state.formData.isServiced,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(isServiced: newValue),
                );
              },
            ),
            BooleanFiledWithTitle(
              title: "Inside master plan?".tr(context),
              value: state.formData.isInsideMasterPlan,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(isInsideMasterPlan: newValue),
                );
              },
            ),
          ],
        );
      case PropertableEnum.shop:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectFieldWithTitle(
              title: "Shop Type".tr(context),
              values: ShopType.values,
              selectedValues: [state.formData.selectedShopType],
              onSelect: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(selectedShopType: newValue),
                );
              },
              enumToName: (enu) => enu.name.tr(context),
            ),
            BooleanFiledWithTitle(
              title: "Has warehouse?".tr(context),
              value: state.formData.hasWarehouse,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(hasWarehouse: newValue),
                );
              },
            ),
            BooleanFiledWithTitle(
              title: "Has bathroom?".tr(context),
              value: state.formData.hasBathroom,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(hasBathroom: newValue),
                );
              },
            ),
            BooleanFiledWithTitle(
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
      case PropertableEnum.office:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NumberFieldWithTitle(
              title: "Floor".tr(context),
              value: state.formData.officeFloor,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(officeFloor: newValue),
                );
              },
            ),
            NumberFieldWithTitle(
              title: "Rooms".tr(context),
              value: state.formData.officeRooms,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(officeRooms: newValue),
                );
              },
            ),
            NumberFieldWithTitle(
              title: "Bathrooms".tr(context),
              value: state.formData.officeBathrooms,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(officeBathrooms: newValue),
                );
              },
            ),
            NumberFieldWithTitle(
              title: "Meeting Rooms".tr(context),
              value: state.formData.meetingRooms,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(meetingRooms: newValue),
                );
              },
            ),
            BooleanFiledWithTitle(
              title: "Has Parking?".tr(context),
              value: state.formData.hasParking,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(hasParking: newValue),
                );
              },
            ),
            BooleanFiledWithTitle(
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
      case PropertableEnum.apartment:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NumberFieldWithTitle(
              title: "Floor".tr(context),
              value: state.formData.floor,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(floor: newValue),
                );
              },
            ),
            NumberFieldWithTitle(
              title: "Rooms".tr(context),
              value: state.formData.apartmentRooms,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(apartmentRooms: newValue),
                );
              },
            ),
            NumberFieldWithTitle(
              title: "Bathrooms".tr(context),
              value: state.formData.apartmentBathrooms,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(apartmentBathrooms: newValue),
                );
              },
            ),
            NumberFieldWithTitle(
              title: "Bedrooms".tr(context),
              value: state.formData.apartmentBedrooms,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(apartmentBedrooms: newValue),
                );
              },
            ),
            BooleanFiledWithTitle(
              title: "Has Elevator?".tr(context),
              value: state.formData.hasElevator,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(hasElevator: newValue),
                );
              },
            ),
            BooleanFiledWithTitle(
              title: "Has Alternative Power?".tr(context),
              value: state.formData.hasAlternativePower,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(hasAlternativePower: newValue),
                );
              },
            ),
            BooleanFiledWithTitle(
              title: "Has Garage?".tr(context),
              value: state.formData.hasGarage,
              onChanged: (newValue) {
                cubit.updateFormData(
                  (currentFormData) =>
                      currentFormData.copyWith(hasGarage: newValue),
                );
              },
            ),
            SelectFieldWithTitle(
              title: "Furnished Type".tr(context),
              values: FurnishedType.values,
              selectedValues: [state.formData.apartmentFurnishedType],
              onSelect: (newValue) {
                cubit.updateFormData(
                  (currentFormData) => currentFormData.copyWith(
                    apartmentFurnishedType: newValue,
                  ),
                );
              },
              enumToName: (enu) => enu.name,
            ),
          ],
        );
    }
  }
}
