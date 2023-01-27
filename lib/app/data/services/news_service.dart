import 'dart:convert';
import 'dart:io';

import 'package:membership/app/data/models/news_model.dart';
import 'package:membership/app/data/models/news_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/api/base_url.dart';
import '../../helpers/http_request_helper.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class NewsService {
  Dio dio = Dio();
  Response response;

  Future<NewsModel> getNews() async {
    response = await dio.get(
      BaseUrl.baseUrl + 'v1/news',
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
    );

    return NewsModel.fromJson(response.data);
  }

  Future<NewsDetailModel> getNewsDetail({int id}) async {
    response = await dio.get(
      BaseUrl.baseUrl + 'v1/news/${id}',
      options: Options(headers: HttpRequestHelper.setHeaderHttpRequest()),
      queryParameters: {
        'id': id,
      },
    );

    return NewsDetailModel.fromJson(response.data);
  }
}
