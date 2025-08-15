import 'package:aqar_go/domain/model/search/search_filter_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/model/apartment/furnished_type.dart';
import '../../../../../domain/model/land/land_slop.dart';
import '../../../../../domain/model/land/land_type.dart';
import '../../../../../domain/model/shop/shop_type.dart';

class SearchFilterCubit extends Cubit<SearchFilterSettings> {
  final SearchFilterSettings? initialSettings;

  SearchFilterCubit(this.initialSettings)
    : super(initialSettings ?? SearchFilterSettings.empty()) {
    _fillControllers(initialSettings);
    _addListeners();
  }

  final minPriceController = TextEditingController(text: "");
  final maxPriceController = TextEditingController(text: "");
  final minAreaController = TextEditingController(text: "");
  final maxAreaController = TextEditingController(text: "");

  // apartment
  final apartmentMinFloorController = TextEditingController(text: "");
  final apartmentMaxFloorController = TextEditingController(text: "");
  final apartmentMinRoomsController = TextEditingController(text: "");
  final apartmentMaxRoomsController = TextEditingController(text: "");
  final apartmentMinBedroomsController = TextEditingController(text: "");
  final apartmentMinBathroomsController = TextEditingController(text: "");

  // office
  final officeMinBathroomsController = TextEditingController(text: "");
  final officeMinMeetingRoomsController = TextEditingController(text: "");

  void update(
    SearchFilterSettings Function(SearchFilterSettings currentSettings) update,
  ) {
    emit(update(state));
  }

  void resetFilters() {
    emit(SearchFilterSettings.empty());
    _fillControllers(SearchFilterSettings.empty());
  }

  // select or unselect furnished type
  void updateFurnishedType(FurnishedType newValue) {
    update((currentSettings) {
      List<FurnishedType> emitThis = List.from(
        currentSettings.apartmentFurnishedTypes ?? [],
      );
      if (currentSettings.apartmentFurnishedTypes?.contains(newValue) ??
          false) {
        // unselect it
        emitThis.remove(newValue);
      } else {
        // select it
        emitThis.add(newValue);
      }
      return currentSettings.copyWith(apartmentFurnishedTypes: emitThis);
    });
  }

  /// select or unselect land type
  void updateLandType(LandType newValue) {
    update((currentSettings) {
      List<LandType> emitThis = List.from(currentSettings.landTypes ?? []);
      if (currentSettings.landTypes?.contains(newValue) ?? false) {
        // unselect it
        emitThis.remove(newValue);
      } else {
        // select it
        emitThis.add(newValue);
      }
      return currentSettings.copyWith(landTypes: emitThis);
    });
  }

  // select or unselect land slop
  void updateLandSlop(LandSlop newValue) {
    update((currentSettings) {
      List<LandSlop> emitThis = List.from(currentSettings.landSlops ?? []);
      if (currentSettings.landSlops?.contains(newValue) ?? false) {
        // unselect it
        emitThis.remove(newValue);
      } else {
        // select it
        emitThis.add(newValue);
      }
      return currentSettings.copyWith(landSlops: emitThis);
    });
  }

  // select or unselect shop type
  void updateShopType(ShopType newValue) {
    update((currentSettings) {
      List<ShopType> emitThis = List.from(currentSettings.shopTypes ?? []);
      if (currentSettings.shopTypes?.contains(newValue) ?? false) {
        // unselect it
        emitThis.remove(newValue);
      } else {
        // select it
        emitThis.add(newValue);
      }
      return currentSettings.copyWith(shopTypes: emitThis);
    });
  }

  /// update boolean values
  void updateBooleanValue({
    bool? apartmentHasAlternativePower,
    bool? apartmentHasGarage,
    bool? apartmentHasFurnished,
    bool? apartmentHasElevator,
    bool? landIsServiced,
    bool? landIsInsideMasterPlan,
    bool? officeHasParking,
    bool? officeIsFurnished,
    bool? shopHasWarehouse,
    bool? shopHasBathroom,
    bool? shopHasAc,
  }) {
    var newValue = state.copyWith(
      apartmentHasAlternativePower:
          apartmentHasAlternativePower != null
              ? (state.apartmentHasAlternativePower !=
                      apartmentHasAlternativePower
                  ? apartmentHasAlternativePower
                  : null)
              : state.apartmentHasAlternativePower,
      apartmentHasGarage:
          apartmentHasGarage != null
              ? (state.apartmentHasGarage != apartmentHasGarage
                  ? apartmentHasGarage
                  : null)
              : state.apartmentHasGarage,
      apartmentHasFurnished:
          apartmentHasFurnished != null
              ? (state.apartmentHasFurnished != apartmentHasFurnished
                  ? apartmentHasFurnished
                  : null)
              : state.apartmentHasFurnished,
      apartmentHasElevator:
          apartmentHasElevator != null
              ? (state.apartmentHasElevator != apartmentHasElevator
                  ? apartmentHasElevator
                  : null)
              : state.apartmentHasElevator,
      landIsServiced:
          landIsServiced != null
              ? (state.landIsServiced != landIsServiced ? landIsServiced : null)
              : state.landIsServiced,
      landIsInsideMasterPlan:
          landIsInsideMasterPlan != null
              ? (state.landIsInsideMasterPlan != landIsInsideMasterPlan
                  ? landIsInsideMasterPlan
                  : null)
              : state.landIsInsideMasterPlan,
      officeHasParking:
          officeHasParking != null
              ? (state.officeHasParking != officeHasParking
                  ? officeHasParking
                  : null)
              : state.officeHasParking,
      officeIsFurnished:
          officeIsFurnished != null
              ? (state.officeIsFurnished != officeIsFurnished
                  ? officeIsFurnished
                  : null)
              : state.officeIsFurnished,
      shopHasWarehouse:
          shopHasWarehouse != null
              ? (state.shopHasWarehouse != shopHasWarehouse
                  ? shopHasWarehouse
                  : null)
              : state.shopHasWarehouse,
      shopHasBathroom:
          shopHasBathroom != null
              ? (state.shopHasBathroom != shopHasBathroom
                  ? shopHasBathroom
                  : null)
              : state.shopHasBathroom,
      shopHasAc:
          shopHasAc != null
              ? (state.shopHasAc != shopHasAc ? shopHasAc : null)
              : state.shopHasAc,
    );
    emit(newValue);
    // i want to create a function for emitting boolean values of the searchfiltersettings boolean values, if the current value == the emitted values (the user clicks on the card while its selected) (so he want to unselect it) => emit null insteaad
    // check what is the non null value
    // if oldValue != value -> emit(value)
    // if oldValue == value -> emit(null)
  }

  // fill the TextEditingControllers
  void _fillControllers(SearchFilterSettings? settings) {
    if (settings == null) return;
    minPriceController.text = settings.minPrice?.toString() ?? '';
    maxPriceController.text = settings.maxPrice?.toString() ?? '';
    minAreaController.text = settings.minArea?.toString() ?? '';
    maxAreaController.text = settings.maxArea?.toString() ?? '';
    apartmentMinFloorController.text =
        settings.apartmentMinFloor?.toString() ?? '';
    apartmentMaxFloorController.text =
        settings.apartmentMaxFloor?.toString() ?? '';
    apartmentMinRoomsController.text =
        settings.apartmentMinRooms?.toString() ?? '';
    apartmentMaxRoomsController.text = settings.apartmentMaxRooms?.toString() ?? '';
    apartmentMinBedroomsController.text =
        settings.apartmentMinBedrooms?.toString() ?? '';
    apartmentMinBathroomsController.text =
        settings.apartmentMinBathrooms?.toString() ?? '';
    officeMinBathroomsController.text =
        settings.officeMinBathrooms?.toString() ?? '';
    officeMinMeetingRoomsController.text =
        settings.officeMinMeetingRooms?.toString() ?? '';
  }

  // TextEditingControllers listeners
  void _addListeners() {
    minPriceController.addListener(_onMinPriceChanged);
    maxPriceController.addListener(_onMaxPriceChanged);
    minAreaController.addListener(_onMinAreaChanged);
    maxAreaController.addListener(_onMaxAreaChanged);
    apartmentMinFloorController.addListener(_onApartmentMinFloorChanged);
    apartmentMaxFloorController.addListener(_onApartmentMaxFloorChanged);
    apartmentMinRoomsController.addListener(_onApartmentMinRoomsChanged);
    apartmentMaxRoomsController.addListener(_onApartmentMaxRoomsChanged);
    apartmentMinBedroomsController.addListener(_onApartmentMinBedroomsChanged);
    apartmentMinBathroomsController.addListener(_onApartmentMinBathroomsChanged);
    officeMinBathroomsController.addListener(_onOfficeMinBathroomsChanged);
    officeMinMeetingRoomsController.addListener(
      _onOfficeMinMeetingRoomsChanged,
    );
  }

  void _onMinPriceChanged() {
    emit(state.copyWith(minPrice: _tryParseInt(minPriceController.text)));
  }

  void _onMaxPriceChanged() {
    emit(state.copyWith(maxPrice: _tryParseInt(maxPriceController.text)));
  }

  void _onMinAreaChanged() {
    emit(state.copyWith(minArea: _tryParseInt(minAreaController.text)));
  }

  void _onMaxAreaChanged() {
    emit(state.copyWith(maxArea: _tryParseInt(maxAreaController.text)));
  }

  void _onApartmentMinFloorChanged() {
    emit(
      state.copyWith(
        apartmentMinFloor: _tryParseInt(apartmentMinFloorController.text),
      ),
    );
  }

  void _onApartmentMaxFloorChanged() {
    emit(
      state.copyWith(
        apartmentMaxFloor: _tryParseInt(apartmentMaxFloorController.text),
      ),
    );
  }

  void _onApartmentMinRoomsChanged() {
    emit(
      state.copyWith(
        apartmentMinRooms: _tryParseInt(apartmentMinRoomsController.text),
      ),
    );
  }

  void _onApartmentMaxRoomsChanged() {
    emit(
      state.copyWith(
        apartmentMaxRooms: _tryParseInt(apartmentMaxRoomsController.text),
      ),
    );
  }

  void _onApartmentMinBedroomsChanged() {
    emit(
      state.copyWith(
        apartmentMinBedrooms: _tryParseInt(apartmentMinBedroomsController.text),
      ),
    );
  }

  void _onApartmentMinBathroomsChanged() {
    emit(
      state.copyWith(
        apartmentMinBathrooms: _tryParseInt(apartmentMinBathroomsController.text),
      ),
    );
  }

  void _onOfficeMinBathroomsChanged() {
    emit(
      state.copyWith(
        officeMinBathrooms: _tryParseInt(officeMinBathroomsController.text),
      ),
    );
  }

  void _onOfficeMinMeetingRoomsChanged() {
    emit(
      state.copyWith(
        officeMinMeetingRooms: _tryParseInt(
          officeMinMeetingRoomsController.text,
        ),
      ),
    );
  }

  int? _tryParseInt(String value) {
    final parsed = int.tryParse(value);
    return parsed;
  }

  @override
  Future<void> close() {
    minPriceController.dispose();
    maxPriceController.dispose();
    minAreaController.dispose();
    maxAreaController.dispose();
    apartmentMinFloorController.dispose();
    apartmentMaxFloorController.dispose();
    apartmentMinRoomsController.dispose();
    apartmentMaxRoomsController.dispose();
    apartmentMinBedroomsController.dispose();
    apartmentMinBathroomsController.dispose();
    return super.close();
  }
}
