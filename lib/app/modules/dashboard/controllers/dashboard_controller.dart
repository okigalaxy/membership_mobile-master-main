import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:membership/app/modules/auth/login/views/login_view.dart';

class DashboardController extends GetxController {
  var localStorage = GetStorage();
  RxInt currentIndex = 0.obs;

  changeTabIndex(int index) {
    currentIndex.value = index;
  }

  Future<void> signOut() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    localStorage.remove('isLogin');
    Get.to(LoginView());
  }
}
