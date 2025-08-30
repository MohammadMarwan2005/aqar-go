import 'package:aqar_go/presentation/feature/notification/cubit/notification_cubit.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/model/notification/notification.dart'
    as my_notification_file;

import '../../widgets/screen_horizontal_padding.dart';
import '../paging_base/cubit/paging_cubit.dart';
import '../paging_base/paged_list_view.dart';
import 'notifications_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications".tr(context))),
      body: SafeArea(
        child: BlocBuilder<
          NotificationCubit,
          PagingState<my_notification_file.Notification>
        >(
          builder: (context, state) {
            return PagedListView(
              itemPadding: 0,
              noMoreItemsPlaceholder: (state) {
                if (state.getCurrentLoadedItems().isEmpty) {
                  return Center(
                    child: Text("No favorites ads found".tr(context)),
                  );
                }
                return SizedBox.shrink();
              },
              scrollDirection: Axis.vertical,
              state: state,
              itemBuilder: (notification) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: NotificationCard(notification: notification),
                );
              },
              fetchNextPage: () {
                context.read<NotificationCubit>().fetchNextPageItems();
              },
              onRefresh: () {
                context.read<NotificationCubit>().resetState();
              },
            );
          },
        ),
      ),
    );
  }
}
