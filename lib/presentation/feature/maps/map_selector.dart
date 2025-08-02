import 'package:aqar_go/domain/model/resource.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'cubit/maps_cubit.dart';

class MapSelector extends StatelessWidget {
  final String titleId;
  final double? initialLat;
  final double? initialLong;

  const MapSelector({
    super.key,
    this.titleId = "Location",
    this.initialLat,
    this.initialLong,
  });

  @override
  Widget build(BuildContext context) {
    final initialLocation =
        (initialLat != null && initialLong != null)
            ? LatLng(initialLat!, initialLong!)
            : null;
    final mapsCubit = context.read<MapsCubit>();
    if (initialLocation != null && mapsCubit.state.selectedMarker == null) {
      mapsCubit.setMarker(initialLocation);
    }
    return FormField<Marker>(
      initialValue: context.read<MapsCubit>().state.selectedMarker,
      validator: (value) {
        if (value == null) {
          return "Location is Required".tr(context);
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (field) {
        final titleWidget =
            (field.hasError)
                ? Text(
                  "${titleId.tr(context)} *",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                )
                : Text(
                  "${titleId.tr(context)} (${field.value?.position.longitude.toStringAsFixed(3) ?? "_"}, ${field.value?.position.longitude.toStringAsFixed(3) ?? "_"})",
                  style: Theme.of(context).textTheme.titleLarge,
                );

        return BlocConsumer<MapsCubit, MapsState>(
          listener: (context, state) {
            field.didChange(state.selectedMarker);
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleWidget,
                SizedBox(height: 8),
                SizedBox(
                  height: 300,
                  child: GoogleMap(
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      ),
                    },
                    initialCameraPosition: CameraPosition(
                      target: initialLocation ?? state.mapLocation,
                      zoom: 14,
                    ),
                    mapType: MapType.satellite,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    onMapCreated: (controller) {
                      mapsCubit.setMapController(controller);
                    },
                    onTap: mapsCubit.setMarker,
                    onLongPress: mapsCubit.setMarker,
                    markers: state.getMarkerAsSet(),
                    padding: EdgeInsets.all(0),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
