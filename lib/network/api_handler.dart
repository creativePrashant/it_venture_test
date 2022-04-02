import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:diadem/utils/memory_management.dart';
import 'package:diadem/models/error/api_error.dart';
import 'package:diadem/utils/messges.dart';
import 'package:flutter/material.dart';

enum MethodType { POST, GET, PUT, DELETE }

const Duration timeoutDuration = const Duration(seconds: 60);

class APIHandler {
  static Map<String, String> defaultHeaders = {
    "Content-Type": "application/json",
    "device_type": Platform.isAndroid ? "1" : "2",
    "app_version": "1.0.0",
    "Content-Type": "application/x-www-form-urlencoded"
  };

  static Dio dio = Dio();

  // POST method
  static Future<dynamic> post({
    dynamic requestBody,
    String? url,
    Map<String, String> additionalHeaders = const {},
  }) async {
    return await _hitApi(
      url: url!,
      methodType: MethodType.POST,
      requestBody: requestBody,
      additionalHeaders: additionalHeaders,
    );
  }

  // GET method
  static Future<dynamic> get({
    required String url,
    dynamic requestBody,
    Map<String, String> additionalHeaders = const {},
  }) async {
    return await _hitApi(
      url: url,
      methodType: MethodType.GET,
      requestBody: requestBody,
      additionalHeaders: additionalHeaders,
    );
  }

  // GET method
  static Future<dynamic> delete({
    required String url,
    dynamic requestBody,
    Map<String, String> additionalHeaders = const {},
  }) async {
    return await _hitApi(
      url: url,
      methodType: MethodType.DELETE,
      requestBody: requestBody,
      additionalHeaders: additionalHeaders,
    );
  }

  // PUT method
  static Future<dynamic> put({
    required dynamic requestBody,
    required String url,
    Map<String, String> additionalHeaders = const {},
  }) async {
    return await _hitApi(
      url: url,
      methodType: MethodType.PUT,
      requestBody: requestBody,
      additionalHeaders: additionalHeaders,
    );
  }

  // Generic HTTP method
  static Future<dynamic> _hitApi({
    required MethodType methodType,
    required String url,
    dynamic requestBody,
    Map<String, String> additionalHeaders = const {},
  }) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    try {
      Map<String, String> headers = {};
      headers.addAll(defaultHeaders);
      headers.addAll(additionalHeaders);

      try {
        if (MemoryManagement.getAccessToken() != null) {
          headers["Authorization"] =
              "Bearer " + MemoryManagement.getAccessToken();

          debugPrint("token" + "Bearer " + MemoryManagement.getAccessToken());
          //  }
          // else {
          //   headers["Authorization"] = 'Bearer ' +
          //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4MjhjMjM3Yi0yMmY3LTRlZWYtODEyMy0wYjQ2YmQ5NjBkZTMiLCJlbWFpbCI6InRlc3RAZ21haWwuY29tIiwianRpIjoiNGJkZmYyMTUtNzliMS00M2JjLTg5YjQtMTBkODA3YmFkMDI5IiwidW5pcXVlX25hbWUiOiJ0ZXN0QGdtYWlsLmNvbSIsInJvbGUiOiJVc2VyIiwibmJmIjoxNjM2Mjc5ODUxLCJleHAiOjE2MzYzMjMwNTEsImlhdCI6MTYzNjI3OTg1MSwiaXNzIjoiRmxha2UiLCJhdWQiOiJGbGFrZUZpeEF1ZGllbmNlIn0.Ym8FxUkrD6XOcynTqZG8fYt4lxRm40PgHPYBGMwrOrU";
        }
      } catch (e) {
        print(e);
      }

      var response;

      switch (methodType) {
        case MethodType.POST:
          response = await dio
              .post(
                url,
                options: Options(
                  headers: headers,
                ),
                data: requestBody,
              )
              .timeout(timeoutDuration);

          break;
        case MethodType.GET:
          response = await dio
              .get(url,
                  options: Options(
                    headers: headers,
                  ),
                  queryParameters: requestBody)
              .timeout(timeoutDuration);

          break;
        case MethodType.PUT:
          response = await dio
              .put(
                url,
                data: json.encode(requestBody),
                options: Options(
                  headers: headers,
                ),
              )
              .timeout(timeoutDuration);
          break;
        case MethodType.DELETE:
          response = await dio
              .delete(
                url,
                options: Options(
                  headers: headers,
                ),
              )
              .timeout(timeoutDuration);
          break;
      }

      print("api handler responsebody: ${json.encode(response.data)}");
      print("api handler response code: ${response?.statusCode}");

      completer.complete(response.data);
    } on DioError catch (e) {
      print("dio cath ${e.message}");
      print("error ${e.response?.statusCode}");
      print("messag ${e.response?.data}");
      print("messag ${e.response}");

      if (e.response?.statusCode == 403) {
        APIError apiError = new APIError(
          error: parseError(e.response!.data),
          status: 403,
          onAlertPop: () {},
        );
        completer.complete(apiError);
      } else if (e.response?.statusCode == 400) {
        print(e.response!.data);
        APIError apiError = new APIError(
          error: parseError(e.response!.data),
          message: e.response!.data,
          status: 400,
        );
        completer.complete(apiError);
      } else if (e.response?.statusCode == 401) {
        APIError apiError = new APIError(
          error: parseError(e.response!.data),
          status: 401,
        );
        completer.complete(apiError);
      } else {
        APIError apiError = new APIError(
            error: parseError(e.response?.data ?? ""),
            message: e.response?.data ?? "",
            status: e.response?.statusCode ?? 0);
        completer.complete(apiError);
      }
    } catch (e) {
      print("errror ${e.toString()}");
      APIError apiError =
          new APIError(error: Messages.genericError, status: 500);
      completer.complete(apiError);
    }
    return completer.future;
  }

  static String parseError(dynamic response) {
    print("parse erro ${response}");
    try {
      var error = response["error"];
      if (error == null) {
        var status = response["status"];
        if (status == false) {
          if (response["data"]["email"] != null)
            return response["data"]["email"][0] ?? Messages.genericError;
          else if (response["data"]["username"] != null)
            return response["data"]["username"][0] ?? Messages.genericError;
          else
            return Messages.genericError;
        }
      }
      return error;
    } catch (e) {
      print("error ${e.toString()}");
      return Messages.genericError;
    }
  }

  static String parseErrorMessage(dynamic response) {
    try {
      return response["message"];
    } catch (e) {
      return Messages.genericError;
    }
  }
}
