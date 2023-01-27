import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:membership/app/api/base_url.dart';
import '../../helpers/http_request_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/data/models/login_model.dart';
import 'package:membership/app/data/models/message_model_forgot.dart';

class AuthService {
  Dio dio = Dio();
  Response response;

  Future<LoginModel> postLogin({Map<String, dynamic> dataRequest}) async {
    response = await dio.post(
      BaseUrl.baseUrl + "auth/login",
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
      queryParameters: dataRequest,
    );

    return loginModelFromJson(json.encode(response.data));
  }

  Future<MessageModel> postResetPassword(
      {Map<String, dynamic> dataRequest}) async {
    response = await dio.post(
      BaseUrl.baseUrl + "v1/forgot-password",
      queryParameters: dataRequest,
    );

    return messageModelFromJson(jsonEncode(response.data));
  }
}
