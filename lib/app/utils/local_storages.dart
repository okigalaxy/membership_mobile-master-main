import 'package:get_storage/get_storage.dart';

class LocalStorages {
  static final box = GetStorage();
  bool isLogin = box.read('isLogin') ?? false;
  bool nama = box.read('nama') ?? false;
  String token = box.read('token') ?? false;
  static const String isSignIn = "isLogin";
  static const String email = "email";
  static const String identity = "identity";
  static const String password = "password";
  static const String fromPageName = "pageName";
  static const String bearerToken = "bearerToken";
}
