part of 'maps_cubit.dart';

const _initialLocation = LatLng(33.4973217, 36.3163583);

class MapsState extends Equatable {
  final LatLng mapLocation;
  final Marker? selectedMarker;

  const MapsState({
    this.mapLocation = _initialLocation,
    this.selectedMarker,
  });

  MapsState copyWith({LatLng? location, Marker? marker}) {
    return MapsState(
      mapLocation: location ?? this.mapLocation,
      selectedMarker: marker ?? this.selectedMarker,
    );
  }

  @override
  List<Object?> get props => [mapLocation, selectedMarker];

  Set<Marker> getMarkerAsSet() =>
      selectedMarker != null ? {selectedMarker!} : {};
}
