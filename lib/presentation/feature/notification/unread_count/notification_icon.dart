import 'package:aqar_go/presentation/feature/notification/unread_count/cubit/notification_unread_count_cubit.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routing/routes.dart';

class NotificationIcon extends StatelessWidget {
  final Color color;

  const NotificationIcon({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      NotificationUnreadCountCubit,
      NotificationUnreadCountState
    >(
      listener: (context, state) {
        state.when(
          loading: () {},
          success: (count) {},
          error: (error) {
            context.showMySnackBar(
              "Failed to load notifications".tr(context),
              actionText: "Try Again".tr(context),
              onActionClick: () {
                context.read<NotificationUnreadCountCubit>().fetchCount();
              },
            );
          },
        );
      },
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<NotificationUnreadCountCubit>().resetToZero();
            context.pushRoute(Routes.notifications);
          },
          icon: Badge(
            isLabelVisible: state.isLabelVisible,
            label: Text(state.getCountLabel()),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(Icons.notifications_none, color: color),
            ),
          ),
        );
      },
    );
  }
}
