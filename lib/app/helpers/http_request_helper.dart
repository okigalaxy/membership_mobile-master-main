import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:membership/app/helpers/info_message_helper.dart';
import 'package:membership/app/helpers/status_sign_in_helper.dart';

import '../modules/dashboard/controllers/dashboard_controller.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/auth/login/views/login_view.dart';
import '../routes/app_pages.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/local_storages.dart';

class HttpRequestHelper {
  static Map<String, dynamic> setHeaderHttpRequest() {
    GetStorage box = GetStorage();
    String bearerToken = LocalStorages.bearerToken;

    Map<String, dynamic> headerHttpRequest = {
      'Authorization': 'Bearer ${box.read(bearerToken)}',
    };

    return headerHttpRequest;
  }

  static void showInfoMessage({DioError error}) {
    final GetStorage box = GetStorage();
    final StatusSignInHelper statusSignInHelper = StatusSignInHelper();

    if (error.response != null) {
      if (error.response.statusCode == 500) {
        if (statusSignInHelper.isSignIn()) {
          box.write(LocalStorages.isSignIn, false);
          Get.to(() => DashboardView());
          Get.put(DashboardController());
          Get.defaultDialog(
            title: "",
            contentPadding: const EdgeInsets.all(10.0),
            content: Column(
              children: [
                Image.asset(Images.sessionExpired, width: 200.0, height: 200.0),
                Text("Session Expired", textAlign: TextAlign.center),
              ],
            ),
            confirm: TextButton(
              onPressed: () {
                Get.back();
                Get.to(() => LoginView());
              },
              child: Text("Login Kembali"),
            ),
          );
        } else {
          Get.defaultDialog(
            title: "",
            contentPadding: const EdgeInsets.all(10.0),
            content: Column(
              children: [
                Image.asset(Images.biforeSignIn, width: 200.0, height: 200.0),
                Text("Belum Login", textAlign: TextAlign.center),
              ],
            ),
            confirm: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: TextButton(
                onPressed: () {
                  Get.back();
                  Get.to(() => LoginView());
                },
                child: Text("Login"),
              ),
            ),
          );
        }
      }
    }
  }
}
