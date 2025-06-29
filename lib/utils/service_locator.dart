import 'package:ecomflutter/Features/HomePage/Data/Repo/home_repo.dart';
import 'package:ecomflutter/Features/HomePage/Data/Repo/order_request_repo.dart';
import 'package:ecomflutter/Features/CheckoutPage/CheckoutPageView/Data/Repo/payment_repo.dart';
import 'package:ecomflutter/Features/HomePage/Data/Repo/notifications_repo.dart';
import 'package:ecomflutter/utils/api_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<HttpApiService>(() => DioApiService());
  sl.registerLazySingleton<BackendAsAService>(() => SupabaseApiService());
  sl.registerLazySingleton<PaymentRepo>(() => PaymentRepo());
  sl.registerLazySingleton<OrderRequestRepo>(() => OrderRequestRepo());
  sl.registerLazySingleton<NotificationsRepo>(() => NotificationsRepo());
  sl.registerLazySingleton<HomeRepo>(() => HomeRepo());
}
