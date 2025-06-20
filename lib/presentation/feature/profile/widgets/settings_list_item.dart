import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsListItem extends StatelessWidget {
  final String iconAsset;
  final String title;
  final VoidCallback onTap;

  const SettingsListItem({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      iconAsset,
                      color: Theme.of(context).colorScheme.primary,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium
                      ,
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ),
        ),
        const Divider(thickness: 0.5, indent: 4, endIndent: 4),
      ],
    );
  }
}
