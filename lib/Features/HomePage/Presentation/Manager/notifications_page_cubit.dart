import 'package:bloc/bloc.dart';
import 'package:ecomflutter/Features/HomePage/Data/Repo/notifications_repo.dart';
import 'package:ecomflutter/utils/service_locator.dart';
import 'package:meta/meta.dart';

part 'notifications_page_state.dart';

class NotificationsPageCubit extends Cubit<NotificationsPageState> {
  NotificationsPageCubit() : super(NotificationsPageLoading()) {
    fetchNotifications();
  }
  void fetchNotifications() async {
    try {
      List<Map<String, dynamic>> notifications =
          await sl<NotificationsRepo>().notifyUsers();
      emit(NotificationsPageSuccess(notifications));
    } catch (e) {
      emit(NotificationsPageError(e.toString()));
    }
  }
}
