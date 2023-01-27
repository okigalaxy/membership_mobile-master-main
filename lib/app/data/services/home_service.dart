import 'dart:convert';
import 'dart:io';

import 'package:membership/app/data/models/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/api/base_url.dart';
import '../../helpers/http_request_helper.dart';
import '../models/message_model.dart';
import '../models/message_logout_model.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class HomeService {
  Dio dio = Dio();
  Response response;

  Future<HomeModel> getHome() async {
    response = await dio.get(
      BaseUrl.baseUrl + 'auth/profile',
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
    );

    return HomeModel.fromJson(response.data);
  }

  Future<MessageLogoutModel> deleteUser() async {
    response = await dio.post(
      BaseUrl.baseUrl + "auth/logout",
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
    );

    return messageLogoutModelFromJson(jsonEncode(response.data));
  }
}
