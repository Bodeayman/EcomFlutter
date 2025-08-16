import 'package:ecomflutter/Features/NotificationsPage/Presentation/Manager/notifications_page_cubit.dart';
import 'package:ecomflutter/Features/NotificationsPage/Presentation/Views/NotificationsPageView/Widgets/notification_notFound_body_view.dart';
import 'package:ecomflutter/Features/NotificationsPage/Presentation/Views/NotificationsPageView/Widgets/notifications_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationFoundBodyView extends StatelessWidget {
  const NotificationFoundBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:
          () async =>
              context.read<NotificationsPageCubit>().fetchNotifications(),
      child: SafeArea(
        child: BlocBuilder<NotificationsPageCubit, NotificationsPageState>(
          builder: (context, state) {
            if (state is NotificationsPageSuccess) {
              if (state.notifications.isEmpty) {
                return NotificationNotfoundBodyView();
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                itemCount: state.notifications.length + 1, // +1 for header
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // The header at the top
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
                  return NotificationsTile(notification: notification);
                },
              );
            } else if (state is NotificationsPageError) {
              return Center(child: Text(state.errMessage));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
