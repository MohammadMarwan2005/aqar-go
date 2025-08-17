import 'package:aqar_go/domain/model/apartment/furnished_type.dart';
import 'package:aqar_go/domain/model/search/search_filter_settings.dart';
import 'package:aqar_go/presentation/feature/search/filter/widgets/number_filter_field.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/boolean_field_with_title.dart';
import 'package:aqar_go/presentation/widgets/single_select_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/model/land/land_slop.dart';
import '../../../../domain/model/land/land_type.dart';
import '../../../../domain/model/property.dart';
import '../../../../domain/model/shop/shop_type.dart';
import '../../../routing/routes.dart';
import '../../../widgets/screen_horizontal_padding.dart';
import '../../create_update_post/create_update_post_screen.dart';
import 'cubit/search_filter_cubit.dart';
import 'widgets/min_max_filter_field.dart';

class SearchFilterScreen extends StatelessWidget {
  SearchFilterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchFilterCubit>();
    return Scaffold(
      appBar: AppBar(title: Text("Search Filters".tr(context))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: AppButton(
                isSecondary: true,
                onPressed: () {
                  context.showMyAlertDialog(
                    "Reset Filters?".tr(context),
                    ["Are you sure you want to reset all filters?".tr(context)],
                    true,
                    gotItPlaceholder: "Reset".tr(context),
                    onGotItClicked: () {
                      cubit.resetFilters();
                    },
                    firstAction: TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text("Cancel".tr(context)),
                    ),
                  );
                },
                text: "Reset".tr(context),
              ),
            ),
            SizedBox(width: 8),
            Flexible(
              flex: 3,
              child: AppButton(
                onPressed: () {
                  final isValid = _formKey.currentState?.validate();
                  if (isValid == true) {
                    context.pushRoute(Routes.searchResults, extra: cubit.state);
                  }
                },
                text: "Search".tr(context),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ScreenPadding(
          child: SingleChildScrollView(
            child: BlocBuilder<SearchFilterCubit, SearchFilterSettings>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TitleAndSpacer(title: "Property Type".tr(context)),
                      PropertableSelector(
                        selectedType: state.type,
                        onSelect: (PropertableEnum newValue) {
                          cubit.update((currentSettings) {
                            if (currentSettings.type == newValue) {
                              return currentSettings.copyWith(type: null);
                            }
                            return currentSettings.copyWith(type: newValue);
                          });
                        },
                      ),
                      _TitleAndSpacer(title: "Price".tr(context)),
                      MinMaxFilterField(
                        minController: cubit.minPriceController,
                        maxController: cubit.maxPriceController,
                        minLabel: "Min".tr(context),
                        maxLabel: "Max".tr(context),
                      ),
                      _LocalizedSizedBox(),
                      _TitleAndSpacer(title: "Area".tr(context)),
                      MinMaxFilterField(
                        minController: cubit.minAreaController,
                        maxController: cubit.maxAreaController,
                        minLabel: "Min".tr(context),
                        maxLabel: "Max".tr(context),
                      ),
                      _LocalizedSizedBox(),
                      _PropertableFields(searchFilterSettings: state),
                      SizedBox(height: 100),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _PropertableFields extends StatelessWidget {
  final SearchFilterSettings searchFilterSettings;

  const _PropertableFields({required this.searchFilterSettings});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchFilterCubit>();
    return switch (searchFilterSettings.type) {
      null => SizedBox.shrink(),
      PropertableEnum.apartment =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // min and max values
              _TitleAndSpacer(title: "Floor".tr(context)),
              MinMaxFilterField(
                minController: cubit.apartmentMinFloorController,
                maxController: cubit.apartmentMaxFloorController,
                minLabel: "Min".tr(context),
                maxLabel: "Max".tr(context),
              ),
              _LocalizedSizedBox(),
              // min values
              _TitleAndSpacer(title: "Rooms".tr(context)),
              MinMaxFilterField(
                  minController: cubit.apartmentMinRoomsController,
                  maxController: cubit.apartmentMaxRoomsController,
                  minLabel: "Min".tr(context),
                  maxLabel: "Max".tr(context)),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Bedrooms".tr(context)),
              _HalfRow(
                child: NumberFilterField(
                  controller: cubit.apartmentMinBedroomsController,
                  label: "Min".tr(context),
                ),
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Bathrooms".tr(context)),
              _HalfRow(
                child: NumberFilterField(
                  controller: cubit.apartmentMinBathroomsController,
                  label: "Min".tr(context),
                ),
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Furniture Type".tr(context)),
              SelectField<FurnishedType>(
                selectedValues: searchFilterSettings.apartmentFurnishedTypes ??
                    [],
                values: FurnishedType.values,
                enumToName: (enu) => enu.name.tr(context),
                onSelect: (newValue) {
                  cubit.updateFurnishedType(newValue);
                },
              ),
              _LocalizedSizedBox(),
              // true or false values
              _TitleAndSpacer(title: "Has Alternative Power".tr(context)),
              BooleanField(
                value: searchFilterSettings.apartmentHasAlternativePower,
                onChanged: (newValue) {
                  cubit.updateBooleanValue(
                      apartmentHasAlternativePower: newValue);
                },
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Has Garage".tr(context)),
              BooleanField(
                value: searchFilterSettings.apartmentHasGarage,
                onChanged: (newValue) {
                  cubit.updateBooleanValue(apartmentHasGarage: newValue);
                },
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Has Furnished".tr(context)),
              BooleanField(
                value: searchFilterSettings.apartmentHasFurnished,
                onChanged: (newValue) {
                  cubit.updateBooleanValue(apartmentHasFurnished: newValue);
                },
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Has Elevator".tr(context)),
              BooleanField(
                value: searchFilterSettings.apartmentHasElevator,
                onChanged: (newValue) {
                  cubit.updateBooleanValue(apartmentHasElevator: newValue);
                },
              ),
            ],
          ),
      PropertableEnum.land =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleAndSpacer(title: "Land Type".tr(context)),
              SelectField<LandType>(
                selectedValues: searchFilterSettings.landTypes ?? [],
                values: LandType.values,
                enumToName: (enu) => enu.name.tr(context),
                onSelect: (newValue) {
                  cubit.updateLandType(newValue);
                },
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Land Slope".tr(context)),
              SelectField<LandSlop>(
                selectedValues: searchFilterSettings.landSlops ?? [],
                values: LandSlop.values,
                enumToName: (enu) => enu.name.tr(context),
                onSelect: (newValue) {
                  cubit.updateLandSlop(newValue);
                },
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Serviced".tr(context)),
              BooleanField(
                value: searchFilterSettings.landIsServiced,
                onChanged: (newValue) {
                  cubit.updateBooleanValue(landIsServiced: newValue);
                },
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Inside master plan?".tr(context)),
              BooleanField(
                value: searchFilterSettings.landIsInsideMasterPlan,
                onChanged: (newValue) {
                  cubit.updateBooleanValue(landIsInsideMasterPlan: newValue);
                },
              ),
            ],
          ),
      PropertableEnum.office =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleAndSpacer(title: "Meeting Rooms".tr(context)),
              _HalfRow(
                child: NumberFilterField(
                  controller: cubit.officeMinMeetingRoomsController,
                  label: "Min".tr(context),
                ),
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Bathrooms".tr(context)),
              _HalfRow(
                child: NumberFilterField(
                  controller: cubit.officeMinBathroomsController,
                  label: "Min".tr(context),
                ),
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Has Parking?".tr(context)),
              BooleanField(
                value: searchFilterSettings.officeHasParking,
                onChanged: (newValue) {
                  cubit.updateBooleanValue(officeHasParking: newValue);
                },
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Furnished?".tr(context)),
              BooleanField(
                value: searchFilterSettings.officeIsFurnished,
                onChanged: (newValue) {
                  cubit.updateBooleanValue(officeIsFurnished: newValue);
                },
              ),
            ],
          ),
      PropertableEnum.shop =>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleAndSpacer(title: "Shop Type".tr(context)),
              SelectField<ShopType>(
                selectedValues: searchFilterSettings.shopTypes ?? [],
                values: ShopType.values,
                enumToName: (enu) => enu.name.tr(context),
                onSelect: (newValue) {
                  cubit.updateShopType(newValue);
                },
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Has warehouse?".tr(context)),
              BooleanField(
                value: searchFilterSettings.shopHasWarehouse,
                onChanged: (newValue) {
                  cubit.updateBooleanValue(shopHasWarehouse: newValue);
                },
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Has Bathroom".tr(context)),
              BooleanField(
                value: searchFilterSettings.shopHasBathroom,
                onChanged: (newValue) {
                  cubit.updateBooleanValue(shopHasBathroom: newValue);
                },
              ),
              _LocalizedSizedBox(),
              _TitleAndSpacer(title: "Has electrical source?".tr(context)),
              BooleanField(
                value: searchFilterSettings.shopHasAc,
                onChanged: (newValue) {
                  cubit.updateBooleanValue(shopHasAc: newValue);
                },
              ),
            ],
          ),
    };
  }
}

class _LocalizedSizedBox extends StatelessWidget {
  const _LocalizedSizedBox();

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 8);
  }
}

class _TitleAndSpacer extends StatelessWidget {
  final String title;

  const _TitleAndSpacer({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(title, style: Theme
          .of(context)
          .textTheme
          .titleMedium)
      ],
    );
  }
}

class _HalfRow extends StatelessWidget {
  final Widget child;

  const _HalfRow({required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: child),
        SizedBox(width: 8),
        Flexible(child: SizedBox.shrink()),
      ],
    );
  }
}
