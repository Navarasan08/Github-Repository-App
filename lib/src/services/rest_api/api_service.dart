import 'dart:convert';
import 'dart:io';
import 'package:github_repos/main.dart';
import 'package:github_repos/src/models/custom_exception.dart';
import 'package:github_repos/src/models/repository_model.dart';
import 'package:github_repos/src/services/rest_api/api_url.dart';
import 'package:http/http.dart' show Client, Response;


class ApiService{

  final client = new Client();
  final restApi = getIt<RestApi>();
  List<Repository> repos = [];

  Future<String> _sendErrorResponse(CustomException exception) async {
    // Api to Send Error To Backend
    await Future.delayed(Duration(milliseconds: 100));

    return jsonEncode({"status" : "Error Response Sent SuccessFully"});

  }


  Future<List<Repository>> getRepos() async{
    Response response;
    try{
      response = await client.get(restApi.repos);
      Map lists = jsonDecode(response.body);
      repos = Repository.getRepoLists(lists['items']);

    } on SocketException catch(e) {
      throw CustomException("No Internet Connection!", CustomExceptionType.noInternet);
    } on HttpException catch(e) {
      var exception = CustomException("Failed to Get Response", CustomExceptionType.notFound);
      _sendErrorResponse(exception);
      throw exception;
    } on FormatException catch(e) {
      throw CustomException("Format Exception!", CustomExceptionType.parseError);
    }
    if(response.statusCode >= 400){
      throw CustomException("Request Not Found.. Please Try Again!", CustomExceptionType.parseError);
    }
    print(response.statusCode);

    return repos;
  }
}

