import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:membership/app/utils/images.dart';
import 'package:membership/app/utils/dimensions.dart';
import 'package:membership/app/utils/text_resource.dart';
import 'package:membership/app/utils/color_resource.dart';
import 'package:membership/app/modules/auth/forgot_password/views/forgot_password_view.dart';

class ButtonForgotPassword extends StatelessWidget {
  const ButtonForgotPassword({
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ForgotPasswordView());
                },
                child: Text(
                  "Lupa Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color.fromARGB(251, 182, 151, 105),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 170),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    TextResource.poweredBy,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: ColorResources.greyColor,
                    ),
                  ),
                  Image.asset(
                    Images.logoInterTech,
                    width: 50.0,
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
