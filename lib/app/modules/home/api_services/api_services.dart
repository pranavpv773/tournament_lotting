import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:git_app/app/api_services/api_endpoints.dart';
import 'package:git_app/app/modules/home/model/repo_model.dart';

class StaredApiService {
  Future<RepoModel?> fetchStaredRepo() async {
    log('reached fn');
    try {
      Response response = await Dio().get(ApiEndpoints.staredRepo);
      if (response.statusCode == 200) {
        log('reached success');
        return RepoModel.fromJson(response.data);
      } else {
        log('reached else');

        return RepoModel.fromJson(response.data);
      }
    } on DioError {
      // log('message');
      // return RepoModel(error: e.message, status: false);
    } catch (e) {
      log('reached error');

      log(e.toString());
      // return RepoModel(error: e.toString(), status: false);
    }
    return null;
  }
}
