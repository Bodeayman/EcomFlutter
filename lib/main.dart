import 'package:ecomflutter/Features/ProductsPage/Data/Models/color.dart';
import 'package:ecomflutter/Features/ProductsPage/Data/Models/item.dart';
import 'package:ecomflutter/Features/NotificationsPage/Data/Models/notificationModel.dart';
import 'package:ecomflutter/Features/OrdersPage/Data/Models/order.dart';
import 'package:ecomflutter/Features/OrdersPage/Data/Models/orderItem.dart';
import 'package:ecomflutter/Features/ProductsPage/Data/Models/size.dart';
import 'package:ecomflutter/Features/NotificationsPage/Presentation/Manager/notifications_page_cubit.dart';
import 'package:ecomflutter/Features/OrdersPage/Presentation/Manager/orders_page_cubit.dart';
import 'package:ecomflutter/firebase_options.dart';
import 'package:ecomflutter/utils/helpers/notification_sender.dart';
import 'package:ecomflutter/utils/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'Features/CheckoutPage/CheckoutPageView/Manager/cart_cubit.dart';
import 'Features/ProductsPage/Presentation/Manager/main_products_cubit.dart';
import 'utils/api_key.dart';
import 'utils/theme_data.dart';
import 'routers.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const initSettings = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  );

  await flutterLocalNotificationsPlugin.initialize(initSettings);

  await setupNotificationChannel();
  await scheduleDailyReminderIfNeeded();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.close();
  await Hive.initFlutter();

  Hive.registerAdapter(NotificationModelAdapter());
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(OrderModelAdapter());
  Hive.registerAdapter(OrderItemAdapter());

  Hive.registerAdapter(CustomerColorAdapter());
  Hive.registerAdapter(CustomerSizeAdapter());
  await Hive.openBox<Item>('allProducts');
  await Hive.openBox<NotificationModel>('allNotifications');
  await Hive.openBox<OrderModel>('allOrders');

  setupServiceLocator(); // For registering the singleton
  await Supabase.initialize(
    url: serverUrl,
    anonKey: supabaseAnon,
    debug: false,
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.info,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => MainProductsCubit()),
        BlocProvider(create: (_) => NotificationsPageCubit()),
        BlocProvider(create: (_) => OrdersPageCubit()),
      ],
      child: SafeArea(
        child: MaterialApp.router(
          color: Colors.white,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          routerConfig: router,
        ),
      ),
    );
  }
}
