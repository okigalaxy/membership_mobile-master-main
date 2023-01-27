import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../helpers/http_request_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/data/models/profile_model.dart';
import 'package:membership/app/data/services/profile_service.dart';

class ContactUsController extends GetxController {
  void launchURL(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
  }

  var localStorage = GetStorage();
  var profileService = ProfileService();
  var profileData = [].obs;
  var tokoData = <Toko>[].obs;
  var loading = false.obs;
  var contactUs = 0.obs;

  @override
  void onInit() {
    profileInit();
    tokoInit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void profileInit() async {
    try {
      loading.toggle();
      ProfileModel response =
          (await profileService.getProfile()) as ProfileModel;
      if (response.success != false) {
        profileData.value = response.data;
      } else {
        profileData.value = [];
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  void tokoInit() async {
    try {
      loading.toggle();
      ProfileModel response =
          (await profileService.getProfile()) as ProfileModel;
      if (response.success != false) {
        tokoData.value = response.toko;
      } else {
        tokoData.value = [];
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  selectContactUs(value) {
    contactUs.value = value;
  }
}
