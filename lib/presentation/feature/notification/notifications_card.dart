import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/routing/routes.dart';
import 'package:flutter/material.dart';
import '../../../domain/model/notification/notification.dart'
    as my_notification;

class NotificationCard extends StatelessWidget {
  final my_notification.Notification notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color =
        (!notification.isRead) ? theme.colorScheme.primary.withOpacity(0.05) : Colors.transparent;

    return InkWell(
      onTap: () {
        context.pushRoute(Routes.getViewAd(notification.adId));
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: color,
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                notification.title.tr(context),
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
              subtitle: Text(
                notification.body.tr(context),
                style: theme.textTheme.bodyLarge,
              ),
              leading: Icon(
                notification.isRead
                    ? Icons.mark_email_read
                    : Icons.mark_email_unread,
                color: theme.colorScheme.primary,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
