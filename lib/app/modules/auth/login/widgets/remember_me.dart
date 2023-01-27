import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:membership/app/utils/text_resource.dart';
import '../controllers/login_controller.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({
    key,
    this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Checkbox(
            value: controller.valueRememberMe.value,
            onChanged: controller.changeValueRememberMe,
          ),
          const Text(TextResource.rememberMe),
        ],
      ),
    );
  }
}
