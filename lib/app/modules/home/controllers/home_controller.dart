import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../utils/local_storages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../helpers/http_request_helper.dart';
import '../../../data/models/message_logout_model.dart';
import 'package:membership/app/data/models/home_model.dart';
import '../../../helpers/info_message_helper.dart';
import 'package:membership/app/data/services/home_service.dart';
import 'package:membership/app/data/models/news_model.dart';
import 'package:membership/app/data/services/news_service.dart';
import 'package:membership/app/modules/auth/login/views/login_view.dart';

class HomeController extends GetxController {
  void launchURL(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
  }

  var localStorage = GetStorage();
  var homeService = HomeService();
  var newsService = NewsService();
  var homeData = [].obs;
  var tokoData = <Toko>[].obs;
  var newsData = [].obs;
  var loading = false.obs;
  var history = 0.obs;
  GetStorage box = GetStorage();

  @override
  void onInit() {
    homeInit();
    newsInit();
    tokoInit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void homeInit() async {
    try {
      loading.toggle();
      HomeModel response = (await homeService.getHome()) as HomeModel;
      if (response.success != false) {
        homeData.value = response.data;
      } else {
        homeData.value = [];
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
      HomeModel response = (await homeService.getHome()) as HomeModel;
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

  void newsInit() async {
    try {
      loading.toggle();
      NewsModel response = (await newsService.getNews()) as NewsModel;
      if (response.success != false) {
        newsData.value = response.data;
      } else {
        newsData.value = [];
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  hapusSessions() async {
    await box.remove(LocalStorages.isSignIn);
    await box.remove(LocalStorages.bearerToken);
    Get.to(() => LoginView());
  }

  logout() async {
    try {
      loading.toggle();
      MessageLogoutModel response = await homeService.deleteUser();
      if (response.success != false) {
        hapusSessions();
        InfoMessageHelper.showMessage(response.message);
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  void signOut() {
    Get.defaultDialog(
      title: "Keluar",
      middleText: "Keluar dari akun Anda?",
      confirm: Padding(
        padding: EdgeInsets.all(14.0),
        child: TextButton(
          onPressed: () async {
            logout();
          },
          child: Text("keluar"),
        ),
      ),
      cancel: Padding(
        padding: EdgeInsets.all(14.0),
        child: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Batal"),
        ),
      ),
    );
  }

  selectHistory(value) {
    history.value = value;
  }
}
