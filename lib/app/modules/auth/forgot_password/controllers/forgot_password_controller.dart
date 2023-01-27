import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:membership/app/modules/auth/login/views/login_view.dart';

import '../../../../data/models/message_model_forgot.dart';
import '../../../../helpers/http_request_helper.dart';
import '../../../../data/services/auth_service.dart';
import '../../../../utils/local_storages.dart';

class ForgotPasswordController extends GetxController {
  // GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  AuthService authService = AuthService();
  GetStorage box = GetStorage();

  var loading = false.obs;

  resetPassword() async {
    final Map<String, dynamic> dataRequest = {
      "email": emailController.text,
    };

    try {
      loading.toggle();
      MessageModel response =
          await authService.postResetPassword(dataRequest: dataRequest);
      if (response.status != false) {
        await box.write(LocalStorages.email, emailController.text);
        emailController.clear();
        Get.snackbar('Success', response.data);
        Get.to(() => LoginView());
      }
    } on DioError catch (error) {
      Get.snackbar('Message', 'Email tidak ditemukan');
    } finally {
      loading.toggle();
    }
  }

  String validateEmail(value) {
    if (!GetUtils.isEmail(value)) {
      return "Entry valid email";
    }
    return null;
  }
}
