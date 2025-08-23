import 'package:flutter/material.dart';

import '../../domain/model/ad/ad.dart';
import 'ad_primary_info.dart';

class SmallAdCard extends StatelessWidget {
  final Ad ad;
  final double height;
  final double width;
  final Function() onTap;

  const SmallAdCard({
    super.key,
    required this.ad,
    required this.height,
    required this.width,
    required this.onTap,
  });

  static double getHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.4;
  static double getWidth(BuildContext context) => MediaQuery.of(context).size.width * 0.8;

  @override
  Widget build(BuildContext context) {
    final imageUrl = ad.property.images.firstOrNull?.imageUrl;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12, bottom: 8, top: 4),
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
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child:
                          (imageUrl != null)
                              ? Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                width: width,
                              )
                              : Image.asset(
                                "assets/images/profile_image_placeholder.png",
                                fit: BoxFit.cover,
                                width: width,
                              ),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      start: 4,
                      child: PropertableTypeChip(
                        propertable: ad.property.propertable,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: AdPrimaryInfo(ad: ad, showPropertyType: false, isDescClickable: false, trimLength: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
