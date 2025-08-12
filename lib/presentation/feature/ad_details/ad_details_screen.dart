import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/images_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/ad/ad.dart';
import '../../../domain/model/media_file.dart';
import '../../../domain/model/property.dart';
import '../../widgets/error_message.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/screen_horizontal_padding.dart';
import 'cubit/ad_details_cubit.dart';

class AdDetailsScreen extends StatelessWidget {
  const AdDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ad Details".tr(context)), actions: []),
      body: SafeArea(
        child: BlocBuilder<AdDetailsCubit, AdDetailsState>(
          builder: (context, state) {
            return state.when(
              loading: () => LoadingScreen(),
              error:
                  (domainError) => ErrorMessage(
                    error: domainError,
                    onTryAgain: () {
                      context.read<AdDetailsCubit>().fetchAd();
                    },
                  ),
              success: (ad) => _AdDetailsContent(ad: ad),
            );
          },
        ),
      ),
    );
  }
}

class _AdDetailsContent extends StatelessWidget {
  final Ad ad;

  const _AdDetailsContent({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    final property = ad.property;

    return Scaffold(
      body: ScreenPadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Images slider
              ImagesSlider.fromFiles(files: ad.property.images),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text("${"Price".tr(context)}: ${property.price}"),
                    Text("${"Area".tr(context)}: ${property.area} m²"),
                    Text("${"Views".tr(context)}: ${ad.views}"),
                    const SizedBox(height: 8),
                    Text(property.description),
                  ],
                ),
              ),

              const Divider(height: 32),

              // Property-specific content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PropertableContent(property.propertable),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PropertableContent extends StatelessWidget {
  final Propertable propertable;

  const PropertableContent(this.propertable, {super.key});

  @override
  Widget build(BuildContext context) {
    switch (propertable) {
      case Apartment a:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _item("Floor", a.floor),
            _item("Rooms", a.rooms),
            _item("Bedrooms", a.bedrooms),
            _item("Bathrooms", a.bathrooms),
            _item("Furnished", a.furnished ? a.furnishedType : "No"),
            _item("Elevator", a.hasElevator),
            _item("Garage", a.hasGarage),
            _item("Alt Power", a.hasAlternativePower),
          ],
        );

      case Office o:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _item("Floor", o.floor),
            _item("Rooms", o.rooms),
            _item("Bathrooms", o.bathrooms),
            _item("Meeting Rooms", o.meetingRooms ?? "-"),
            _item("Parking", o.hasParking),
          ],
        );

      case Land l:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _item("Land Type", l.landType.name),
            _item("Land Slope", l.landSlop.name),
            _item("Serviced", l.isServiced),
            _item("Inside Master Plan", l.isInsideMasterPlan),
          ],
        );

      case Shop s:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _item("Floor", s.floor),
            _item("Shop Type", s.shopType.name),
            _item("Warehouse", s.hasWarehouse),
            _item("Bathroom", s.hasBathroom),
            _item("AC", s.hasAc),
          ],
        );
    }
  }

  Widget _item(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Flexible(child: Text(value.toString())),
        ],
      ),
    );
  }
}
