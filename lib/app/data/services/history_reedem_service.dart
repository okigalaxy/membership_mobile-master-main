import 'dart:convert';
import 'dart:io';

import 'package:membership/app/data/models/history_reedem_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/api/base_url.dart';
import '../../helpers/http_request_helper.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class HistoryReedemService {
  Dio dio = Dio();
  Response response;

  Future<HistoryReedemModel> getHistoryReedem() async {
    response = await dio.get(
      BaseUrl.baseUrl + 'v1/reedemhistory',
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
    );

    return HistoryReedemModel.fromJson(response.data);
  }
}
