import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../helpers/http_request_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/data/models/news_detail_model.dart';
import 'package:membership/app/data/services/news_service.dart';

class DetailBannerController extends GetxController {
  void launchURL(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
  }

  var localStorage = GetStorage();
  var newsdetailService = NewsService();
  var newsdetailData = [].obs;
  var loading = false.obs;
  var history = 0.obs;

  var id = Get.arguments['id'];

  @override
  void onInit() {
    newsDetailInit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void newsDetailInit() async {
    try {
      loading.toggle();
      NewsDetailModel response =
          (await newsdetailService.getNewsDetail(id: id)) as NewsDetailModel;
      if (response.success != false) {
        newsdetailData.value = response.data;
      } else {
        newsdetailData.value = [];
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  selectHistory(value) {
    history.value = value;
  }
}
