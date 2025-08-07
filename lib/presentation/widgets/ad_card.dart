import 'package:aqar_go/presentation/feature/my_ads/my_ad_card.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../domain/model/ad/ad.dart';

class AdCard extends StatelessWidget {
  final Ad ad;

  const AdCard({super.key, required this.ad});

  @override
  Widget build(BuildContext context) {
    return MyAdCard(
      ad: ad,
      onTap: () {
        context.pushRoute(Routes.getViewAd(ad.id));
      },
    );
  }
}
