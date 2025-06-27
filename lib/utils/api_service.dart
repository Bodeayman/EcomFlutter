import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HttpApiService {
  Future<Response> post({
    required body,
    required String url,
    String? token,
    String? contentTypeString,
  });
  Future<Response> get({
    required String url,
    String? token,
    String? contentTypeString,
  });
}

abstract class BackendAsAService {
  Future<List<Map<String, dynamic>>> getData(String tableName);
  String getPublicUrl(String bucket, String path);
}

class DioApiService implements HttpApiService {
  final Dio _dio = Dio();
  @override
  Future<Response> post({
    required body,
    required String url,
    String? token,
    String? contentTypeString,
  }) async {
    var response = await _dio.post(
      url,
      data: body,

      options: Options(
        headers: {if (token != null) 'Authorization': 'Bearer $token'},
        contentType: contentTypeString ?? 'application/json; charset=utf-8',
      ),
    );
    return response;
  }

  @override
  Future<Response> get({
    required String url,
    String? token,
    String? contentTypeString,
  }) async {
    var response = await _dio.get(
      url,
      options: Options(
        headers: {if (token != null) 'Authorization': 'Bearer $token'},
        contentType: contentTypeString ?? 'application/json; charset=utf-8',
      ),
    );
    return response;
  }
}

class SupabaseApiService implements BackendAsAService {
  final client = Supabase.instance.client;

  @override
  Future<List<Map<String, dynamic>>> getData(String tableName) async {
    final response = await client.from(tableName).select();
    return List<Map<String, dynamic>>.from(response);
  }

  @override
  String getPublicUrl(String bucket, String path) {
    return client.storage.from(bucket).getPublicUrl(path);
  }
}
