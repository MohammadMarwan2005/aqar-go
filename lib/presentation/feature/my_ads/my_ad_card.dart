import 'package:aqar_go/domain/model/ad/ad.dart';
import 'package:aqar_go/presentation/helper/date_time_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';

import '../../widgets/ad_card.dart';

class MyAdCard extends StatelessWidget {
  final Ad ad;
  final VoidCallback onTap;

  const MyAdCard({super.key, required this.ad, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AdCard(ad: ad, onTap: onTap, showExpiration: true);
  }
}
