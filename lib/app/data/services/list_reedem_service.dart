import 'dart:convert';
import 'dart:io';

import 'package:membership/app/data/models/list_reedem_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/api/base_url.dart';
import '../../helpers/http_request_helper.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ListReedemService {
  Dio dio = Dio();
  Response response;

  Future<ListReedemModel> getListReedem() async {
    response = await dio.get(
      BaseUrl.baseUrl + 'v1/reedem',
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
    );

    return ListReedemModel.fromJson(response.data);
  }
}
