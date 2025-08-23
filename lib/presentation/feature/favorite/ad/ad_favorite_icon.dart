import 'dart:ui';

import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/ad_favorite_cubit.dart';

class AdFavoriteIcon extends StatelessWidget {
  final bool isGuest;

  const AdFavoriteIcon({super.key, required this.isGuest});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AdFavoriteCubit>();
    return BlocConsumer<AdFavoriteCubit, AdFavoriteState>(
      listener: (context, state) {
        return state.when(
          initial: (isFavorite) {},
          loading: (isFavorite) {},
          error: (isFavorite, error) {
            context.showMySnackBar(error.getMessage(context));
          },
          success: (isFavorite) {
            final messageId =
                (isFavorite == true)
                    ? "Ad added to the favorites successfully"
                    : "Ad removed from the favorites successfully";
            context.showMySnackBar(messageId.tr(context));
          },
        );
      },
      builder: (context, state) {
        if (state.isFavorite == null || isGuest) return SizedBox.shrink();
        final blur = 2.0;

        return ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withAlpha(120), // lighter top-left
                    Colors.white.withAlpha(15), // more transparent bottom-right
                  ],
                ),
              ),
              child: IconButton(
                icon: Icon(
                  state.isFavorite! ? Icons.favorite : Icons.favorite_border,
                  color: state.isFavorite! ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  cubit.toggleFavorite();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
