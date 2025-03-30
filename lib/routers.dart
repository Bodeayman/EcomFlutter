import 'package:ecomflutter/pages/Home/home_view.dart';
import 'package:ecomflutter/pages/OnBoarding/initial_sign_view.dart';
import 'package:ecomflutter/pages/Records/record_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/records", builder: (context, state) => RecordView()),
    GoRoute(path: "/", builder: (context, state) => Home()),
    GoRoute(path: "/initial", builder: (context, state) => InitialSignView()),
  ],
  initialLocation: "/initial",
);
