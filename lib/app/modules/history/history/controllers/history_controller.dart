import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../../helpers/http_request_helper.dart';
import 'package:membership/app/data/models/history_model.dart';
import 'package:membership/app/data/services/history_service.dart';
import 'package:get_storage/get_storage.dart';

class HistoryController extends GetxController {
  var localStorage = GetStorage();
  var historyService = HistoryService();
  var historyData = [].obs;
  var historyDataCurrent = [].obs;
  var loading = false.obs;
  var history = 0.obs;

  RxBool isContainer = false.obs;

  @override
  void onInit() {
    historyInit();
    historyCurrent();
    isContainer.value = true;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void historyCurrent() async {
    try {
      loading.toggle();
      HistoryModel response = await historyService.getHistory();
      if (response.success != false) {
        historyDataCurrent.value = response.data;
      } else {
        historyDataCurrent.value = [];
      }
    } on DioError catch (error) {
      HttpRequestHelper.showInfoMessage(error: error);
    } finally {
      loading.toggle();
    }
  }

  void historyInit() async {
    try {
      loading.toggle();
      HistoryModel response = await historyService.getHistory();
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

  searchHistory(String reference) async {
    final Map<String, dynamic> dataRequest = {
      'reference': reference == "" ? "0" : reference,
    };

    try {
      loading.toggle();
      isContainer.value = false;
      HistoryModel response =
          await historyService.searchHistory(dataRequest: dataRequest);
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

  selectHistory(value) {
    history.value = value;
  }
}
