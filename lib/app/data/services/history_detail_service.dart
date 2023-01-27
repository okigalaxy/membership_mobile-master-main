import 'dart:convert';
import 'dart:io';

import 'package:membership/app/data/models/history_model.dart';
import 'package:membership/app/data/models/history_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/api/base_url.dart';
import '../../helpers/http_request_helper.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class HistoryDetailService {
  Dio dio = Dio();
  Response response;

  Future<HistoryDetailModel> getHistoryDetail({String date}) async {
    response = await dio.get(
      BaseUrl.baseUrl + 'v1/history/${date}',
      queryParameters: {
        'date': date,
      },
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
    );

    return HistoryDetailModel.fromJson(response.data);
  }
}
