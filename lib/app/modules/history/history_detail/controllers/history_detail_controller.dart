import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../../helpers/http_request_helper.dart';
import 'package:membership/app/data/models/history_detail_model.dart';
import 'package:membership/app/data/services/history_detail_service.dart';
import 'package:get_storage/get_storage.dart';

class HistoryDetailController extends GetxController {
  var localStorage = GetStorage();
  var historydetailService = HistoryDetailService();
  var historyData = [].obs;
  var historyDataToko = <Toko>[].obs;
  var historyDataCust = <Customer>[].obs;
  var historyDataTotal = <Total>[].obs;
  RxInt currentIndex = 0.obs;
  var date = Get.arguments['date'];

  var onButton = false.obs;
  var loading = false.obs;
  var history = 1.obs;

  @override
  void onInit() {
    historyInit();
    historyCustInit();
    historyTotalInit();
    historyTokoInit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void historyInit() async {
    try {
      loading.toggle();
      HistoryDetailModel response =
          await historydetailService.getHistoryDetail(date: date);
      if (response.success != false) {
        historyData.value = response.data;
      } else {
        historyData.value = [];
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  void historyCustInit() async {
    try {
      loading.toggle();
      HistoryDetailModel response =
          await historydetailService.getHistoryDetail(date: date);
      if (response.success != false) {
        historyDataCust.value = response.customer;
      } else {
        historyDataCust.value = [];
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  void historyTokoInit() async {
    try {
      loading.toggle();
      HistoryDetailModel response =
          await historydetailService.getHistoryDetail(date: date);
      if (response.success != false) {
        historyDataToko.value = response.toko;
      } else {
        historyDataToko.value = [];
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  void historyTotalInit() async {
    try {
      loading.toggle();
      HistoryDetailModel response =
          await historydetailService.getHistoryDetail(date: date);
      if (response.success != false) {
        historyDataTotal.value = response.total;
      } else {
        historyDataTotal.value = [];
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

  changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
