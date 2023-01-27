import 'package:flutter/material.dart';

import 'package:membership/app/utils/dimensions.dart';
import 'package:membership/app/utils/text_resource.dart';
import '../controllers/login_controller.dart';

class FormInputEmail extends StatelessWidget {
  const FormInputEmail({
    key,
    this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: TextFormField(
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        validator: controller.validateEmail,
        decoration: const InputDecoration(
          label: Text("Username"),
        ),
      ),
    );
  }
}
