import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../utils/transversal.dart';
import 'exception.dart';
import 'network_info.dart';

class ServerApiClient {
  final NetworkInfoRepository networkInfoRepository;

  ServerApiClient({
    required this.networkInfoRepository,
  });

  final Map<String, String> _authHeader = {};

  //Here we can access  to external auth header
  Map<String, String> get authHeader => _authHeader;

  Future<void> _restoreAuthHeaders() async {
    if (_authHeader.isEmpty) {
      _authHeader['Content-Type'] = "application/json";
    }
  }

  Future<T> _processResponse<T>({
    required http.Response response,
    required Future<T> Function() requestFunc,
  }) async {
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return response as T;
    } else if (response.statusCode >= 400 && response.statusCode <= 500) {
      throw ServerException();
    } else if (response.statusCode >= 500) {
      throw ServerException(
          message: "Servicio no disponible. Contacte al administrador");
    } else {
      return response as T;
    }
  }

  ///Method to format response log
  String _formatResponseLog(http.Response response, {Object? requestBody}) {
    final time = DateTime.now().toUtc().toIso8601String();

    JsonEncoder encoder = const JsonEncoder.withIndent('');

    String formatRequesBody =
        requestBody != null ? encoder.convert(requestBody) : '';

    String formattedBodyJson;

    try {
      final json = jsonDecode(response.body);
      formattedBodyJson = encoder.convert(json);
    } catch (_) {
      formattedBodyJson = response.body;
    }

    return '''
            $time
            Request: ${response.request}${formatRequesBody.isNotEmpty == true ? '\n Request body: $formatRequesBody' : ''}
            Response code: ${response.statusCode}
            Body: $formattedBodyJson
            ''';
  }

  ///Method HTTP GET protocol
  Future<http.Response> get(
    host,
    path,
    serverSchema, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final url = Uri(
      scheme: serverSchema,
      host: host,
      path: path,
      queryParameters: queryParameters,
    );

    http.Response response;

    try {
      await _restoreAuthHeaders();
      response =
          await http.get(url, headers: _authHeader..addAll(headers ?? {}));
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        throw ConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      log(_formatResponseLog(response));
    }

    return _processResponse(
      response: response,
      requestFunc: () => get(
        host,
        path,
        serverSchema,
        queryParameters: queryParameters,
        headers: headers,
      ),
    );
  }

  ///Method HTTP POST protocol
  Future<http.Response> post(
    host,
    path,
    serverScheme, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final url = Uri(
      scheme: serverScheme,
      host: host,
      path: path,
      queryParameters: queryParameters,
    );

    final Map<String, String> allHeaders = _authHeader;

    if (headers != null) {
      allHeaders.addAll(headers);
    }
    if (!allHeaders.containsKey('Content-Type')) {
      allHeaders['Content-Type'] = "application/json";
    }

    http.Response response;

    try {
      response = await http.post(
        url,
        headers: allHeaders,
        body: Transversal().fixJson(jsonEncode(body)),
        encoding: encoding,
      );
    } catch (e) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        throw ConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      log(_formatResponseLog(response));
    }

    return _processResponse(
      response: response,
      requestFunc: () => post(
        host,
        path,
        serverScheme,
        queryParameters: queryParameters,
        headers: headers,
        body: body,
        encoding: encoding,
      ),
    );
  }
}
