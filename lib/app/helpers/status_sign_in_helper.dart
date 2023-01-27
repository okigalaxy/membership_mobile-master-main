import 'package:get_storage/get_storage.dart';
import 'package:membership/app/utils/local_storages.dart';

class StatusSignInHelper {
  final GetStorage box = GetStorage();

  bool isSignIn() =>
      box.read(LocalStorages.isSignIn) != null &&
      box.read(LocalStorages.isSignIn) == true;
}
