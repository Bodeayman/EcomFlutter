import 'package:ecomflutter/Features/NotificationsPage/Presentation/Manager/notifications_page_cubit.dart';
import 'package:ecomflutter/utils/widgets/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NotificationFoundBodyView extends StatelessWidget {
  const NotificationFoundBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:
          () async =>
              context.read<NotificationsPageCubit>().fetchNotifications(),
      child: SafeArea(
        child: ListView(
          children: [
            Column(
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
            ),
            BlocBuilder<NotificationsPageCubit, NotificationsPageState>(
              builder: (context, state) {
                if (state is NotificationsPageSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    itemCount: state.notifications.length,
                    itemBuilder: (context, index) {
                      final notification = state.notifications[index];
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
                                      Text(
                                        "Do you want to delete this notification?",
                                      ),
                                      TextButton(
                                        child: Text("No"),
                                        onPressed: () => context.pop(),
                                      ),
                                      TextButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          context
                                              .read<NotificationsPageCubit>()
                                              .deleteANotification(
                                                notification.id,
                                              );
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
                                notification.deliveryDate
                                    .toIso8601String()
                                    .split('T')
                                    .first,
                          ),
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
          ],
        ),
      ),
    );
  }
}
