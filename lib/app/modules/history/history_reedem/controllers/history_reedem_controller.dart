import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../helpers/http_request_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/data/models/history_reedem_model.dart';
import 'package:membership/app/data/services/history_reedem_service.dart';

class HistoryReedemController extends GetxController {
  void launchURL(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
  }

  var localStorage = GetStorage();
  var reedemService = HistoryReedemService();
  var reedemData = [].obs;
  var loading = false.obs;
  var reedem = 0.obs;

  RxBool isContainer = false.obs;

  @override
  void onInit() {
    reedemInit();
    isContainer.value = true;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void reedemInit() async {
    try {
      loading.toggle();
      HistoryReedemModel response =
          (await reedemService.getHistoryReedem()) as HistoryReedemModel;
      if (response.success != false) {
        reedemData.value = response.data;
      } else {
        reedemData.value = [];
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  selectReedem(value) {
    reedem.value = value;
  }
}
