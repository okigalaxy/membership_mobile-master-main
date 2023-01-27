import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:membership/app/api/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../helpers/http_request_helper.dart';
import '../../../../helpers/info_message_helper.dart';
import 'package:membership/app/utils/text_resource.dart';
import 'package:membership/app/utils/local_storages.dart';
import 'package:membership/app/data/models/login_model.dart';
import 'package:membership/app/data/services/auth_service.dart';
import 'package:membership/app/modules/dashboard/views/dashboard_view.dart';

class LoginController extends GetxController {
  // var key = GlobalKey<FormState>();
  var authService = AuthService();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var box = GetStorage();

  RxBool valueRememberMe = false.obs;

  var obscureTextInput = true.obs;
  var emailValidate = false;
  var passwordValidate = false;
  var loading = false.obs;
  var tokenFCM = "".obs;

  @override
  void onInit() {
    checkBoxInit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void signIn() async {
    if (valueRememberMe.value == true) {
      saveUserEmailAndPassword(
          identity: emailController.text, password: passwordController.text);
    } else {
      if (box.read(LocalStorages.identity) != "" &&
          box.read(LocalStorages.password) != "") {
        box.remove(LocalStorages.identity);
        box.remove(LocalStorages.password);
      }
    }

    final Map<String, dynamic> dataRequest = {
      "identity": emailController.text,
      "password": passwordController.text,
    };

    try {
      loading.toggle();
      LoginModel response =
          await authService.postLogin(dataRequest: dataRequest);
      if (response.success != false) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        await box.write(LocalStorages.isSignIn, true);
        await box.write(LocalStorages.bearerToken, response.token);
        Get.snackbar('Berhasil', 'Berhasil Login');
        Get.to(() => DashboardView());
      }
    } on DioError catch (error) {
      Get.snackbar('Message', 'username atau email tidak cocok');
    } finally {
      loading.toggle();
    }
  }

  void secureText() {
    obscureTextInput.toggle();
  }

  String validateEmail(value) {
    if (value.isEmpty) {
      return "Username tidak boleh kosong";
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "Password tidak boleh kosong";
    } else {
      return null;
    }
  }

  void checkBoxInit() {
    emailController.text = getUserEmail();
    passwordController.text = getUserPassword();
    if (box.read(LocalStorages.identity) != "" &&
        box.read(LocalStorages.identity) != null &&
        box.read(LocalStorages.password) != "" &&
        box.read(LocalStorages.password) != null) {
      valueRememberMe.value = true;
    } else {
      valueRememberMe.value = false;
    }
  }

  Future<void> saveUserEmailAndPassword(
      {String identity, String password}) async {
    try {
      await box.write(LocalStorages.identity, identity);
      await box.write(LocalStorages.password, password);
    } catch (e) {
      rethrow;
    }
  }

  String getUserEmail() {
    return box.read(LocalStorages.identity) ?? "";
  }

  String getUserPassword() {
    return box.read(LocalStorages.password) ?? "";
  }

  void changeValueRememberMe(value) {
    valueRememberMe.value = value;
    box.read(LocalStorages.identity) ?? "";
  }
}
