import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../components/body_login_component.dart';
import '../controllers/login_controller.dart';
import '../../../../utils/text_resource.dart';
import '../../../../utils/color_resource.dart';
import 'package:membership/app/utils/images.dart';

class LoginView extends StatefulWidget {
  const LoginView({key}) : super(key: key);
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LoginView> {
  final LoginController controller = Get.put(LoginController());

  Future<bool> _onWillPop() async {
    Get.defaultDialog(
      title: "Keluar aplikasi?",
      middleText: "Apakah Anda yakin akan keluar dari aplikasi",
      confirm: Padding(
        padding: EdgeInsets.all(14.0),
        child: TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: Text("Ya"),
        ),
      ),
      cancel: Padding(
        padding: EdgeInsets.all(14.0),
        child: TextButton(
          onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
          child: Text("Tidak"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BodyLoginComponent(controller: controller),
      ),
    );
  }
}
