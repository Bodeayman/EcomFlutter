import 'package:ecomflutter/Features/HomePage/Data/Repo/notifications_repo.dart';
import 'package:ecomflutter/Features/HomePage/Presentation/Manager/notifications_page_cubit.dart';
import 'package:ecomflutter/shared/utils/option_list_tile.dart';
import 'package:ecomflutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationFoundBodyView extends StatelessWidget {
  const NotificationFoundBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 40),

        Text("Notifications", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 40),
        Expanded(
          child: BlocBuilder<NotificationsPageCubit, NotificationsPageState>(
            builder: (context, state) {
              if (state is NotificationsPageSuccess) {
                return ListView.builder(
                  shrinkWrap: false,
                  itemCount: state.notifications.length,
                  itemBuilder: (context, index) {
                    return OptionListTile(
                      leading: Icon(Icons.notification_add),
                      title: state.notifications[index]["content"],
                    );
                  },
                );
              } else if (state is NotificationsPageError) {
                Center(child: Text(state.errMessage));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
