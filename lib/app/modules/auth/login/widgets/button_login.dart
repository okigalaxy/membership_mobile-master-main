import 'package:flutter/material.dart';

import 'package:membership/app/utils/dimensions.dart';
import 'package:membership/app/utils/text_resource.dart';
import '../controllers/login_controller.dart';
import '../../../../widgets/primary_button.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    key,
    this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: SizedBox(
        height: 45.0,
        child: PrimaryButton(
          title: TextResource.login,
          press: () => controller.signIn(),
          isLoading: controller.loading.value,
        ),
      ),
    );
  }
}
