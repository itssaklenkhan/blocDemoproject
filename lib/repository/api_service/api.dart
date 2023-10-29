import 'package:bloc_demo/repository/api_service/api_client.dart';

class Api {
  final ApiClient _apiClient = ApiClient();

  static final Api _api = Api._internal();

  factory Api() {
    return _api;
  }

  Api._internal();

  Map<String, String> _getHeaderToken() {
    return {
      'Authorization': "Bearer ",
      "Lang": 'en',
    };
  }



}
