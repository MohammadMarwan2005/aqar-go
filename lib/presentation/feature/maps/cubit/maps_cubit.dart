import 'package:aqar_go/presentation/helper/location_permission_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  late GoogleMapController _mapController;

  final LocationManager _locationPermissionManager;

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  MapsCubit(this._locationPermissionManager) : super(MapsState()) {
    _getCurrentLocation();
  }

  void select(LatLng location) {
    emit(state.copyWith(location: location));
  }

  void setMarker(LatLng position) {
    print("${position.longitude} ,${position.latitude}");
    final marker = Marker(
      markerId: MarkerId("selected-location"),
      position: position,
      infoWindow: InfoWindow(title: "Selected Location"),
    );
    emit(state.copyWith(marker: marker));
  }

  Future<void> _getCurrentLocation() async {

    _locationPermissionManager.requestLocationPermission();

    final googleLocation = await _locationPermissionManager.getLocation();
    emit(state.copyWith(location: googleLocation));

    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: googleLocation, zoom: 14),
      ),
    );
  }
}
