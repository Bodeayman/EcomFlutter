import 'package:ecomflutter/Features/HomePage/Presentation/Manager/notifications_page_cubit.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationFoundBodyView extends StatelessWidget {
  const NotificationFoundBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<NotificationsPageCubit, NotificationsPageState>(
        builder: (context, state) {
          if (state is NotificationsPageSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              itemCount: state.notifications.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: const [
                      SizedBox(height: 40),
                      Center(
                        child: Text(
                          "Notifications",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  );
                }

                final notification = state.notifications[index - 1];
                return InkWell(
                  onLongPress: () {
                    context.read<NotificationsPageCubit>().deleteANotification(
                      notification.id,
                    );
                  },
                  child: OptionListTile(
                    leading: const Icon(Icons.notification_add),
                    title: notification.content,
                    subtitle:
                        notification.deliveryDate
                            .toIso8601String()
                            .split('T')
                            .first,
                  ),
                );
              },
            );
          } else if (state is NotificationsPageError) {
            return Center(child: Text(state.errMessage));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
