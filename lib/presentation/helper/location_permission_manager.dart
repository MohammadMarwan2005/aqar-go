import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/model/resource.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationManager {
  Future<LocationStatus> requestLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return LocationStatus.serviceDisabled;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission.toLocationStatus();
  }

  Future<LatLng> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );

    final googleLocation = LatLng(position.latitude, position.longitude);
    return googleLocation;
  }
}

enum LocationStatus {
  alwaysAllowed,
  allowedWileInUse,
  denied,
  deniedForever,
  unableToDetermine,
  serviceDisabled;

  Resource<void> toResource() {
    return switch (this) {
      LocationStatus.alwaysAllowed => Success(null),
      LocationStatus.allowedWileInUse => Success(null),
      LocationStatus.denied => Error(
        DomainError.locationPermissionIsDeniedError,
      ),
      LocationStatus.deniedForever => Error(
        DomainError.locationPermissionIsDeniedError,
      ),
      LocationStatus.unableToDetermine => Error(
        DomainError.cantGetYourLocationError,
      ),
      LocationStatus.serviceDisabled => Error(
        DomainError.cantGetYourLocationError,
      ),
    };
  }
}

extension LocationPermissionToLocationStatus on LocationPermission {
  LocationStatus toLocationStatus() {
    return switch (this) {
      LocationPermission.denied => LocationStatus.denied,
      LocationPermission.deniedForever => LocationStatus.deniedForever,
      LocationPermission.whileInUse => LocationStatus.allowedWileInUse,
      LocationPermission.always => LocationStatus.alwaysAllowed,
      LocationPermission.unableToDetermine => LocationStatus.unableToDetermine,
    };
  }
}
