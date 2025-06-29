import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';

Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

Future<bool> isConnected() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}
