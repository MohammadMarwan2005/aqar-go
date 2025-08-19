import 'package:aqar_go/presentation/helper/date_time_helper.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:aqar_go/presentation/widgets/green_red_chip.dart';
import 'package:flutter/material.dart';

import '../../domain/model/ad/ad.dart';
import 'ad_primary_info.dart';

class AdCard extends StatelessWidget {
  final Ad ad;
  final Function()? onTap;
  final bool showExpiration;

  const AdCard({
    super.key,
    required this.ad,
    this.onTap,
    this.showExpiration = false,
  });

  @override
  Widget build(BuildContext context) {
    final isExpired = !ad.isActive;
    final expiredText ="${"Expired on".tr(context)} ${ad.expirationDateUTC.toLocal().formatToShortDateWithHour()}";
    final activeText = "${"Expires on".tr(context)} ${ad.expirationDateUTC.toLocal().formatToShortDateWithHour()}";
    final imageUrl = ad.property.images.firstOrNull?.imageUrl;

    return GestureDetector(
      onTap:
          onTap ??
          () {
            context.pushRoute(Routes.getViewAd(ad.id));
          },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child:
                        (imageUrl != null)
                            ? Image.network(imageUrl, fit: BoxFit.cover)
                            : Image.asset(
                              "assets/images/profile_image_placeholder.png",
                              fit: BoxFit.cover,
                            ),
                  ),
                ),
                if (showExpiration)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GreenRedChip(goodText: activeText, badText: expiredText, good: !isExpired),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: AdPrimaryInfo(ad: ad),
            ),
          ],
        ),
      ),
    );
  }
}
