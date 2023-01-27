import 'dart:convert';
import 'dart:io';

import 'package:membership/app/data/models/history_model.dart';
import 'package:membership/app/data/models/history_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/api/base_url.dart';
import '../../helpers/http_request_helper.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class HistoryService {
  Dio dio = Dio();
  Response response;

  Future<HistoryModel> getHistory() async {
    response = await dio.get(
      BaseUrl.baseUrl + 'v1/history',
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
    );

    return HistoryModel.fromJson(response.data);
  }

  Future<HistoryModel> searchHistory({Map<String, dynamic> dataRequest}) async {
    response = await dio.get(
      BaseUrl.baseUrl + 'v1/search',
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
      queryParameters: dataRequest,
    );

    return HistoryModel.fromJson(response.data);
  }
}
