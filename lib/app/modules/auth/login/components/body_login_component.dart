import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/dimensions.dart';
import '../controllers/login_controller.dart';
import '../widgets/button_forgot_password.dart';
import '../widgets/button_login.dart';
import '../widgets/form_input_email.dart';
import '../widgets/form_input_password.dart';
import '../widgets/logo_company.dart';
import '../widgets/remember_me.dart';

class BodyLoginComponent extends StatelessWidget {
  const BodyLoginComponent({
    key,
    this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: controller.key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ListView(
        children: [
          const SizedBox(height: Dimensions.paddingSizeDefault),
          const LogoCompany(),
          const SizedBox(height: Dimensions.paddingSizeExtraLarge),
          FormInputEmail(controller: controller),
          const SizedBox(height: Dimensions.paddingSizeDefault),
          FormInputPassword(controller: controller),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          RememberMe(controller: controller),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          ButtonLogin(controller: controller),
          const SizedBox(height: Dimensions.paddingSizeDefault),
          ButtonForgotPassword(),
        ],
      ),
    );
  }
}
