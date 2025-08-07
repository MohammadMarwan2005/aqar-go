import 'package:aqar_go/domain/model/ad/ad.dart';
import 'package:aqar_go/presentation/helper/date_time_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';

class MyAdCard extends StatelessWidget {
  final Ad ad;
  final VoidCallback onTap;

  const MyAdCard({super.key, required this.ad, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final imageUrl = ad.property.images.firstOrNull?.imageUrl;
    final isExpired = !ad.isActive;
    final expirationText =
        isExpired
            ? "${"Expired on".tr(context)} ${ad.expirationDateUTC.toLocal().formatToShortDateWithHour()}"
            : "${"Expires on".tr(context)} ${ad.expirationDateUTC.toLocal().formatToShortDateWithHour()}";

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child:
                      (imageUrl != null)
                          ? Image.network(imageUrl, fit: BoxFit.cover)
                          : Image.asset(
                            "assets/images/profile_image_placeholder.png",
                            fit: BoxFit.cover,
                          ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ad.property.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        ad.property.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.square_foot, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text('${ad.property.area} m²'),
                          SizedBox(width: 16),
                          Icon(
                            Icons.attach_money,
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4),
                          Text('${ad.property.price}'),
                          Spacer(),
                          Chip(
                            label: Text(
                              ad.property.propertable.toEnum().labelId.tr(
                                context,
                              ),
                            ),
                            backgroundColor: Colors.blue.shade50,
                            labelStyle: TextStyle(color: Colors.blue.shade800),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.visibility, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            '${ad.views} views',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Expiration Label
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      isExpired ? Colors.red.shade100 : Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  expirationText,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color:
                        isExpired ? Colors.red.shade800 : Colors.green.shade800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
