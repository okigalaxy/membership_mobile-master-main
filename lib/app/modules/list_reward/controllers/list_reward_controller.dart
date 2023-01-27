import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../../../helpers/http_request_helper.dart';
import 'package:membership/app/data/models/home_model.dart';
import 'package:membership/app/data/services/home_service.dart';
import 'package:membership/app/data/models/list_reedem_model.dart';
import 'package:membership/app/data/services/list_reedem_service.dart';

class ListRewardController extends GetxController {
  var localStorage = GetStorage();
  var reedemService = ListReedemService();
  var homeService = HomeService();
  var reedemData = [].obs;
  var homeData = [].obs;
  var loading = false.obs;
  var history = 0.obs;

  @override
  void onInit() {
    homeInit();
    reedemInit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void homeInit() async {
    try {
      loading.toggle();
      HomeModel response = (await homeService.getHome()) as HomeModel;
      if (response.success != false) {
        homeData.value = response.data;
      } else {
        homeData.value = [];
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  void reedemInit() async {
    try {
      loading.toggle();
      ListReedemModel response =
          (await reedemService.getListReedem()) as ListReedemModel;
      if (response.success != false) {
        reedemData.value = response.data;
      } else {
        reedemData.value = [];
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  selectHistory(value) {
    history.value = value;
  }
}
