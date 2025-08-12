import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/feature/my_ad_details/my_ad_actions_cubit/my_ad_actions_cubit.dart';
import 'package:aqar_go/presentation/feature/my_ad_details/my_ad_details_cubit/my_ad_details_cubit.dart';
import 'package:aqar_go/presentation/helper/date_time_helper.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/screen_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/model/ad/ad.dart';
import '../../../domain/model/media_file.dart';
import '../../../domain/model/property.dart';
import '../../widgets/app_button.dart';
import '../../widgets/error_message.dart';
import '../../widgets/images_slider.dart';
import '../../widgets/loading_screen.dart';

class MyAdDetailsScreen extends StatelessWidget {
  const MyAdDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Ad Details".tr(context)), actions: []),
      body: SafeArea(
        child: BlocBuilder<MyAdDetailsCubit, MyAdDetailsState>(
          builder: (context, state) {
            return state.when(
              loading: () => LoadingScreen(),
              error:
                  (domainError) => ErrorMessage(
                    error: domainError,
                    onTryAgain: () {
                      context.read<MyAdDetailsCubit>().fetchMyAd();
                    },
                  ),
              success: (ad) => _MyAdDetailsContent(ad: ad),
            );
          },
        ),
      ),
    );
  }
}

class _MyAdDetailsContent extends StatelessWidget {
  final Ad ad;

  const _MyAdDetailsContent({super.key, required this.ad});

  // property content: scrollable column
  //    page view for images with dots
  //    data like(title, description, price, area)
  //    propertable data: (land, office, apartment, shop) // create a widget PropertableContent(propertable)
  @override
  Widget build(BuildContext context) {
    final property = ad.property;
    final expirationText =
        ad.isExpired
            ? "${"Expired on".tr(context)} ${ad.expirationDateUTC.toLocal().formatToShortDateWithHour()}"
            : "${"Expires on".tr(context)} ${ad.expirationDateUTC.toLocal().formatToShortDateWithHour()}";

    return Scaffold(
      bottomNavigationBar: _MyAdActionsWidget(ad: ad),
      body: ScreenPadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Images slider
              ImagesSlider.fromFiles(files: ad.property.images),
              const SizedBox(height: 12),

              // Title & expiration info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      expirationText,
                      style: TextStyle(
                        color: ad.isExpired ? Colors.red : Colors.grey,
                      ),
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

class _MyAdActionsWidget extends StatelessWidget {
  final Ad ad;

  const _MyAdActionsWidget({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    final myAdActionsCubit = context.read<MyAdActionsCubit>();
    final myAdDetailsCubit = context.read<MyAdDetailsCubit>();
    return BlocConsumer<MyAdActionsCubit, MyAdActionsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                isLoading:
                    state.isLoadingActivating() ||
                    state.isLoadingDeactivating(),
                onPressed: () {
                  myAdActionsCubit.doAction(
                    ad.isActive ? MyAdAction.deactivate : MyAdAction.activate,
                  );
                },
                text:
                    ad.isActive
                        ? "Deactivate".tr(context)
                        : "Activate".tr(context),
              ),
              SizedBox(height: 8),
              AppButton(
                isSecondary: true,
                isLoading: state.isLoadingDeleting(),
                onPressed: () {
                  context.showMyAlertDialog(
                    "Delete Ad".tr(context),
                    ["Are you sure you want to delete this ad?".tr(context)],
                    true,
                    gotItPlaceholder: "Cancel".tr(context),
                    firstAction: TextButton(
                      onPressed: () {
                        context.pop();
                        myAdActionsCubit.doAction(MyAdAction.delete);
                      },
                      child: Text("Delete Ad".tr(context)),
                    ),
                  );
                },
                text: "Delete Ad".tr(context),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: (myAdAction) {},
          error: (error, myAdAction) {
            context.showMyAlertDialogFromDomainError(error);
          },
          success: (myAdAction) {
            final message = _getMessage(context, myAdAction);
            context.showMyAlertDialog(
              "Done".tr(context),
              [message],
              false,
              onGotItClicked: () {
                switch (myAdAction) {
                  case MyAdAction.activate:
                    myAdDetailsCubit.fetchMyAd();
                  case MyAdAction.deactivate:
                    myAdDetailsCubit.fetchMyAd();
                  case MyAdAction.delete:
                    context.popRoute();
                    context.showMySnackBar(
                      "Ad deleted successfully!".tr(context),
                    );
                    context.popRoute();
                }
              },
            );
          },
        );
      },
    );
  }

  String _getMessage(BuildContext context, MyAdAction action) {
    switch (action) {
      case MyAdAction.activate:
        return "Ad Activated".tr(context);
      case MyAdAction.deactivate:
        return "Ad Deactivated".tr(context);
      case MyAdAction.delete:
        return "Ad Deleted".tr(context);
    }
  }
}
