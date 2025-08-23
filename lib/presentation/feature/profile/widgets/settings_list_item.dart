import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsListItem extends StatelessWidget {
  final String? iconAsset;
  final IconData? iconData;
  final String title;
  final VoidCallback onTap;

  const SettingsListItem({
    super.key,
    this.iconAsset,
    this.iconData,
    required this.title,
    required this.onTap,
  }) : assert(iconAsset != null || iconData != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (iconAsset != null)
                      SvgPicture.asset(
                        iconAsset!,
                        color: Theme.of(context).colorScheme.primary,
                        width: 24,
                        height: 24,
                      ),
                    if (iconData != null && iconAsset == null)
                      Icon(
                        iconData!,
                        color: Theme.of(context).colorScheme.primary,
                        size: 24,
                      ),
                    const SizedBox(width: 16),
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
        ),
        const Divider(thickness: 0.5, indent: 4, endIndent: 4),
      ],
    );
  }
}
