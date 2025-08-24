import 'package:ecomflutter/Features/NotificationsPage/Data/Models/notificationModel.dart';
import 'package:ecomflutter/Features/NotificationsPage/Presentation/Manager/notifications_page_cubit.dart';
import 'package:ecomflutter/utils/widgets/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Do you want to delete this notification?"),
                    TextButton(
                      child: const Text("No"),
                      onPressed: () => context.pop(),
                    ),
                    TextButton(
                      child: const Text("Yes"),
                      onPressed: () {
                        context
                            .read<NotificationsPageCubit>()
                            .deleteANotification(notification.id);
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: SizedBox(
        height: 95,
        child: OptionListTile(
          leading: const Icon(Icons.notification_add),
          title: notification.content,
          subtitle:
              "${notification.deliveryDate.toIso8601String().split('T').first} ${notification.deliveryDate.toIso8601String().split('T').last.substring(0, 5)}",
        ),
      ),
    );
  }
}
