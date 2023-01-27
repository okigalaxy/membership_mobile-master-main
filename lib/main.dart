import 'package:get/get.dart';
import 'app/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:membership/app/helpers/status_sign_in_helper.dart';
import 'package:membership/app/modules/auth/login/views/login_view.dart';
import 'package:membership/app/modules/dashboard/views/dashboard_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(MembershipApp()),
  );
}

class MembershipApp extends StatefulWidget {
  const MembershipApp({key}) : super(key: key);
  @override
  _MembershipAppState createState() => _MembershipAppState();
}

class _MembershipAppState extends State<MembershipApp> {
  bool _isLoggedIn = false;
  GetStorage box = GetStorage();

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    final StatusSignInHelper statusSignInHelper = StatusSignInHelper();
    if (statusSignInHelper.isSignIn()) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _isLoggedIn ? DashboardView() : LoginView(),
      ),
      theme: ThemeApp.theme,
    );
  }
}
