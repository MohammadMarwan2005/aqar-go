import 'package:aqar_go/domain/model/property.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/expandable_text.dart';
import 'package:aqar_go/presentation/widgets/url_widget.dart';
import 'package:flutter/material.dart';

import '../../domain/model/ad/ad.dart';
import '../helper/url_helper.dart';

class AdPrimaryInfo extends StatelessWidget {
  final Ad ad;
  final bool showPropertyType;
  final bool isLocationLink;

  const AdPrimaryInfo({
    super.key,
    required this.ad,
    this.showPropertyType = true,
    this.isLocationLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ad.property.title,
          maxLines: 2,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        ExpandableText(
          text: ad.property.description,
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                _TitleAndIcon(
                  title: "${ad.property.area} ${"m2".tr(context)}",
                  icon: Icon(Icons.square_foot, size: 16, color: Colors.grey),
                ),
                _TitleAndIcon(
                  title: "${ad.views} ${"views".tr(context)}",
                  icon: Icon(Icons.visibility, size: 16, color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TitleAndIcon(
                  title: '${ad.property.price}',
                  icon: Icon(Icons.attach_money, size: 16, color: Colors.grey),
                ),
                _LocationWidget(
                  isLink: isLocationLink,
                  lat: ad.property.lat,
                  long: ad.property.long,
                  addressName: ad.property.addressName,
                ),
              ],
            ),
            Spacer(),
            if (showPropertyType)
              PropertableTypeChip(propertable: ad.property.propertable),
            if (!showPropertyType) Spacer(),
          ],
        ),
      ],
    );
  }
}

class PropertableTypeChip extends StatelessWidget {
  final Propertable propertable;

  const PropertableTypeChip({super.key, required this.propertable});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(propertable.toEnum().labelId.tr(context)),
      backgroundColor: Colors.blue.shade50,
      labelStyle: Theme.of(
        context,
      ).textTheme.bodySmall?.copyWith(color: Colors.blue.shade800),
      padding: EdgeInsets.symmetric(horizontal: 4),
    );
  }
}

class _TitleAndIcon extends StatelessWidget {
  final String title;
  final Icon icon;
  final Color? titleColor;

  const _TitleAndIcon({
    required this.title,
    required this.icon,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 4),
        Text(title, style: TextStyle(color: titleColor)),
      ],
    );
  }
}

class _LocationWidget extends StatelessWidget {
  final bool isLink;
  final double lat;
  final double long;
  final String addressName;

  const _LocationWidget({
    required this.isLink,
    required this.lat,
    required this.long,
    required this.addressName,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLink) {
      return _TitleAndIcon(
        title: addressName,
        icon: Icon(Icons.location_on, size: 16, color: Colors.grey),
      );
    }

    final locationUrl = getGoogleMapsUrl(lat, long);

    return UrlWidget(
      url: locationUrl,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: _TitleAndIcon(
          title: addressName,
          titleColor: Colors.blue,
          icon: Icon(Icons.location_on, size: 16, color: Colors.blue),
        ),
      ),
    );
  }
}
