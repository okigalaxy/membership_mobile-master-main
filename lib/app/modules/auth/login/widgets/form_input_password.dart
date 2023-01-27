import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:membership/app/utils/dimensions.dart';
import 'package:membership/app/utils/text_resource.dart';
import '../controllers/login_controller.dart';

class FormInputPassword extends StatelessWidget {
  const FormInputPassword({
    key,
    this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault),
        child: TextFormField(
          controller: controller.passwordController,
          keyboardType: TextInputType.visiblePassword,
          validator: controller.validatePassword,
          obscureText: controller.obscureTextInput.value,
          decoration: InputDecoration(
            label: const Text(TextResource.password),
            suffixIcon: IconButton(
              icon: Icon(
                controller.obscureTextInput.value
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              onPressed: () => controller.secureText(),
            ),
          ),
        ),
      ),
    );
  }
}
