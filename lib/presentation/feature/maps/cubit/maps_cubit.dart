import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  late GoogleMapController _mapController;

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  MapsCubit() : super(MapsState()) {
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
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );

    final googleLocation = LatLng(position.latitude, position.longitude);
    emit(state.copyWith(location: googleLocation));

    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: googleLocation, zoom: 14),
      ),
    );
  }
}
