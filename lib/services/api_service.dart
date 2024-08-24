import 'package:dio/dio.dart';

import 'package:sportapp/core/app_urls.dart';

import 'client_service.dart';

class ApiService {
  final APIClient apiClient = APIClient();
  Future<Response> login({var params}) {
    return apiClient.post(url: AppUrls.users, params: params);
  }

  Future<Response> getUserData() {
    return apiClient.get(
      url: AppUrls.users,
    );
  }
}
