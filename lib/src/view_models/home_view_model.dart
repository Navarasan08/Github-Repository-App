

import 'dart:async';

import 'package:github_repos/main.dart';
import 'package:github_repos/src/services/rest_api/api_service.dart';
import 'package:github_repos/src/view_models/base_model.dart';

class HomeViewModel extends BaseModel {

  ApiService _apiService = getIt<ApiService>();

  Stream<dynamic> getRepos() {
    return _apiService.getRepos().asStream();
  }


}