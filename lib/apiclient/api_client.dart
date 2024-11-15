import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../utils/api_constants.dart';


class ApiClient {
  Future<dynamic> callApi(
      {required ApiRequestMethods method,
      required String endpoint,
      Map<String, String>? headers,
      Object? body,
      Map<String, String>? queryParams,
      bool isTokenNeeded = true,
      bool isLoaderNeeded = false}) async {
    body = body ?? {};
    headers = headers ?? {};

    final url=Uri.http(AppUrl.baseUrl,endpoint,queryParams);

    String? encodedBody;
    if (method == ApiRequestMethods.post ||
        method == ApiRequestMethods.put ||
        method == ApiRequestMethods.patch) {
      encodedBody = jsonEncode(body ?? {});
    }
    headers['Content-Type']='application/json';

    // if(isTokenNeeded) {
    //   final token = LocalStorage.getString(LocalStorageKeys.token);
    //   headers['Authorization'] = 'Bearer $token';
    // }
    late Future<http.Response> response;
    switch (method){
      case ApiRequestMethods.get:
        response = http.get(url, headers: headers);
        break;
      case ApiRequestMethods.post:
        response=http.post(url,headers: headers,body: encodedBody);
        break;
      case ApiRequestMethods.put:
        response=http.put(url,headers: headers,body: encodedBody);
        break;
      case ApiRequestMethods.patch:
        response=http.patch(url,headers: headers,body: encodedBody);
        break;
      case ApiRequestMethods.delete:
        response=http.delete(url,headers: headers);
        break;
      default:
        const Text('No such Case defined');
    }
    return handleResponse(
      response: response,
      isLoaderNeeded: isLoaderNeeded,
    );
  }

  Future<dynamic> handleResponse({
    required Future<http.Response> response,
    required bool isLoaderNeeded,
  }) async {
    if (isLoaderNeeded) loader();

    final res = await response;
    if (isLoaderNeeded) Get.back();

    print("${res.body} =======> response");

    // Initialize decodedBody as null
    dynamic decodedBody;

    // Only decode the response body if it's not empty
    if (res.body.isNotEmpty) {
      try {
        decodedBody = jsonDecode(res.body);
      } catch (e) {
        print('Error decoding response: $e');
        errorDialog('Invalid JSON response from the server.');
        return null;
      }
    } else {
      print('Response body is empty');
    }

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return decodedBody ?? {};
    } else {
      if (decodedBody != null && decodedBody is Map && decodedBody.containsKey('detail')) {
        errorDialog(decodedBody['detail']);
      } else {
        errorDialog('An error occurred. Status code: ${res.statusCode}');
      }
    }

    return null;
  }

  Future<dynamic> loader() async {
    return Get.dialog(
      const AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          content: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ))),
    );
    // return Get.dialog(
    //   const AlertDialog(
    //       backgroundColor: Colors.transparent,
    //       elevation: 0.0,
    //
    //       content: RingLoader(),
    // )
    // );

  }

  Future<dynamic> errorDialog(String? decodedBody) {
    return Get.dialog(AlertDialog(
      title: const Text("Errors"),
      content: Text(decodedBody ?? ''),
    ));
  }
}


enum ApiRequestMethods{
  get,put,post,delete,patch
}
