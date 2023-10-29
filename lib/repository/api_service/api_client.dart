import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiClient {
  static final ApiClient _apiClient = ApiClient._internal();

  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  Future<String> getMethod({
    required String url,
    Map<String, String>? header,
  }) async {
    try {
      log(url);
      if (header != null) {
        log(header.toString());
      }
      final response = await http.get(
        Uri.parse(url),
        headers: header,
      );
      log(response.body);
      return response.body;
    } catch (e) {
      log("______ getMethode error ${e.toString()}");
      return '';
    }
  }

  // Post request
  Future<String> postMethod({
    required url,
    required Map<String, String> body,
    Map<String, String>? header,
  }) async {
    try {
      log(url);
      if (header != null) {
        log(header.toString());
      }
      log(body.toString());
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: header,
      );
      log(response.body);
      return response.body;
    } catch (e) {
      log("______ post Method error ${e.toString()}");
      return '';
    }
  }

  Future<String> postMethodMultipart(
    http.MultipartRequest request, {
    Map<String, String>? header,
  }) async {
    try {
      log(request.fields.toString());
      if (request.files.isNotEmpty) {
        for (var element in request.files) {
          log(element.filename.toString());
        }
      }
      if (header != null) {
        request.headers.addAll(header);
      }
      http.Response response =
          await http.Response.fromStream(await request.send());
      log(response.body.toString());
      return response.body;
    } catch (e) {
      log("______ postMethodMultipart error ${e.toString()}");
      return '';
    }
  }
}
