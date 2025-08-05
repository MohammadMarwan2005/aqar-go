import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assets/assets.gen.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? pickedImagePath;
  final bool isPremium;
  final Function() onEditPressed;

  const ProfileAvatar({
    super.key,
    this.imageUrl,
    this.pickedImagePath,
    required this.onEditPressed,
    required this.isPremium,
  });

  @override
  Widget build(BuildContext context) {
    final double doubleRadius = 120;
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: doubleRadius / 2 + 10,
            child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child:
                  (pickedImagePath != null)
                      ? Image.file(
                        File(pickedImagePath!),
                        width: doubleRadius,
                        height: doubleRadius,
                        fit: BoxFit.cover,
                      )
                      : (imageUrl != null)
                      ? Image.network(
                        imageUrl!,
                        width: doubleRadius,
                        height: doubleRadius,
                        fit: BoxFit.cover,
                      )
                      // todo: use flutter gen
                      : Image.asset(
                        "assets/images/profile_image_placeholder.png",
                        width: doubleRadius,
                        height: doubleRadius,
                        fit: BoxFit.cover,
                      ),
            ),
          ),
          IconButton(
            onPressed: onEditPressed,
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          if (isPremium || true) ...[
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  Assets.svgs.diamond.path, // or Icons.workspace_premium
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
