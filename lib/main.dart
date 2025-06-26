import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Features/CheckoutPage/CheckoutPageView/Manager/cart_cubit.dart';
import 'Features/HomePage/Presentation/Manager/main_products_cubit.dart';
import 'cubit/theme_cubit.dart';
import 'utils/api_key.dart';
import 'utils/theme_data.dart';
import 'routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('myCart');

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

  runApp(const BootstrapApp());
}

class BootstrapApp extends StatelessWidget {
  const BootstrapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CartCubit()),
            BlocProvider(create: (_) => MainProductsCubit()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
