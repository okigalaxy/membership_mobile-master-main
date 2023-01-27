import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/forgot_password_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/primary_button.dart';

import '../../../../utils/color_resource.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                width: 238,
                                height: 190,
                                child: Image.asset(
                                  Images.logoAbc,
                                  width: 238,
                                  height: 150,
                                ),
                              ),
                            ),
                            Text(
                              'Lupa Password',
                              style: TextStyle(
                                height: 2,
                                color: Color.fromARGB(255, 40, 22, 1),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lexend',
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Silahkan masukan email aktif anda, untuk mendapatkan link perubahan password anda di email yang telah didaftarkan.',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 1),
                                  TextFormField(
                                    controller: controller.emailController,
                                    autofocus: true,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: controller.validateEmail,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                      label: Text("Email Address"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Container(
                                child: PrimaryButton(
                                  title: "Kirim Link Ke Email",
                                  press: () => controller.resetPassword(),
                                  isLoading: controller.loading.value,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
