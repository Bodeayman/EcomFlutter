import 'package:ecomflutter/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final secureStorage = FlutterSecureStorage();

Future<void> saveSession(Session session) async {
  await secureStorage.write(key: 'access_token', value: session.accessToken);
  await secureStorage.write(key: 'refresh_token', value: session.refreshToken);
  await secureStorage.write(
    key: 'expires_at',
    value:
        (DateTime.now().millisecondsSinceEpoch + (session.expiresIn! * 1000))
            .toString(),
  );
}

Future<String?> getAccessToken() async {
  return await secureStorage.read(key: 'access_token');
}

Future<String?> getRefreshToken() async {
  return await secureStorage.read(key: 'refresh_token');
}

Future<int?> getExpiresAt() async {
  final value = await secureStorage.read(key: 'expires_at');
  return value != null ? int.tryParse(value) : null;
}

Future<bool> ensureValidSession() async {
  final accessToken = await getAccessToken();
  final refreshToken = await getRefreshToken();
  final expiresAt = await getExpiresAt();
  final now = DateTime.now().millisecondsSinceEpoch;

  if (accessToken == null || expiresAt == null) {
    await clearSession();
    GoRouter.of(navigatorKey.currentContext!).go('/initial');

    return false;
  }

  if (now > expiresAt) {
    // Token expired → try refresh
    if (refreshToken != null) {
      final response = await Supabase.instance.client.auth.refreshSession();
      final newSession = response.session;

      if (newSession != null) {
        await saveSession(newSession);
        return true;
      } else {
        await clearSession();
        GoRouter.of(navigatorKey.currentContext!).go('/initial');

        return false;
      }
    } else {
      await clearSession();
      GoRouter.of(navigatorKey.currentContext!).go('/initial');

      return false;
    }
  }

  return true;
}

Future<void> clearSession() async {
  await secureStorage.deleteAll();
}
