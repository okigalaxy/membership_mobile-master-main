import 'dart:convert';
import 'dart:io';

import 'package:membership/app/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/api/base_url.dart';
import '../../helpers/http_request_helper.dart';
import '../models/message_model.dart';
import 'package:dio/dio.dart';

class ProfileService {
  Dio dio = Dio();
  Response response;

  Future<ProfileModel> getProfile() async {
    response = await dio.get(
      BaseUrl.baseUrl + 'auth/profile',
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
    );

    return ProfileModel.fromJson(response.data);
  }

  Future<MessageModel> deleteUser() async {
    response = await dio.post(
      BaseUrl.baseUrl + 'auth/logout',
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
    );

    return messageModelFromJson(jsonEncode(response.data));
  }
}
