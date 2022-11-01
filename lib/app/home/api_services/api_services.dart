import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:git_app/app/api_services/api_endpoints.dart';
import 'package:git_app/app/home/model/repo_model.dart';

class StaredApiService {
  Future fetchStaredRepo() async {
    log('reached dio');
    try {
      Response response = await Dio().get(ApiEndpoints.staredRepo);
      if (response.statusCode == 200) {
        return RepositoryModel.fromJson(response.data);
      } else {
        return RepositoryModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      Fluttertoast.showToast(
        msg: e.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
