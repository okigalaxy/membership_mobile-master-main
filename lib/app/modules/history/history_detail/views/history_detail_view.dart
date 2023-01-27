import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:membership/app/modules/history/history_detail/controllers/history_detail_controller.dart';

import '../controllers/history_detail_controller.dart';
import '../../../../utils/color_resource.dart';
import '../../../../utils/text_resource.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';

class HistoryDetailView extends GetView<HistoryDetailController> {
  HistoryDetailView({key}) : super(key: key);

  final HistoryDetailController controller = Get.put(HistoryDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.loading.value != false) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.historyDataCust.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 800));
              controller.historyCustInit();
              controller.historyInit();
              controller.historyTotalInit();
            },
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/session_expired.png",
                          height: 200,
                        ),
                      ),
                      Text(
                        "data not found".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorResources.blackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 800));
              controller.historyCustInit();
              controller.historyInit();
              controller.historyTotalInit();
            },
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(false),
                        child: SvgPicture.asset(
                          Images.iconBack,
                          color: ColorResources.primaryColor,
                        ),
                      ),
                      SizedBox(width: Dimensions.paddingSizeDefault),
                      Text(
                        TextResource.detail,
                        style: TextStyle(
                          color: ColorResources.primaryColor,
                          fontSize: Dimensions.fontSizeExtraLarge,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                  child: Container(
                    padding:
                        const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                          child: ListView.builder(
                            itemCount: controller.historyDataCust.length &
                                controller.historyDataToko.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          Images.logoAbc,
                                          width: 60.0,
                                          height: 60.0,
                                        ),
                                        const SizedBox(
                                            width: Dimensions.paddingSizeSmall),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                Dimensions
                                                    .paddingSizeExtraSmall),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  controller
                                                              .historyDataToko[
                                                                  index]
                                                              .toko !=
                                                          null
                                                      ? "${controller.historyDataToko[index].toko}"
                                                      : "",
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .fontSizeExtraSmall),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  controller
                                                              .historyDataToko[
                                                                  index]
                                                              .phone !=
                                                          null
                                                      ? "${controller.historyDataToko[index].phone}"
                                                      : "",
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .fontSizeExtraSmall),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  controller
                                                              .historyDataToko[
                                                                  index]
                                                              .email !=
                                                          null
                                                      ? "${controller.historyDataToko[index].email}"
                                                      : "",
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .fontSizeExtraSmall),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  controller
                                                              .historyDataToko[
                                                                  index]
                                                              .alamat !=
                                                          null
                                                      ? "${controller.historyDataToko[index].alamat}"
                                                      : "",
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .fontSizeExtraSmall),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                Dimensions
                                                    .paddingSizeExtraSmall),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  controller
                                                              .historyDataCust[
                                                                  index]
                                                              .tanggal !=
                                                          null
                                                      ? "Tanggal : " +
                                                          "${controller.historyDataCust[index].tanggal}"
                                                      : "",
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .fontSizeExtraSmall),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  controller
                                                              .historyDataCust[
                                                                  index]
                                                              .nama !=
                                                          null
                                                      ? "${controller.historyDataCust[index].nama}"
                                                      : "",
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .fontSizeExtraSmall),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  controller
                                                              .historyDataCust[
                                                                  index]
                                                              .phone !=
                                                          null
                                                      ? "${controller.historyDataCust[index].phone}"
                                                      : "",
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .fontSizeExtraSmall),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                color: ColorResources.goldenColor,
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "#",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall),
                                    ),
                                    Text(
                                      "Barang",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall),
                                    ),
                                    Text(
                                      "Berat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall),
                                    ),
                                    Text(
                                      "Subtotal",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(
                                () {
                                  return Column(
                                    children: controller.historyData
                                        .map(
                                          (historyData) => Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                MaterialButton(
                                                  color: Colors.white,
                                                  onPressed: () {},
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        historyData.tanggal !=
                                                                null
                                                            ? "${historyData.no}"
                                                            : "",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: Dimensions
                                                                .fontSizeExtraSmall),
                                                      ),
                                                      Text(
                                                        historyData.tanggal !=
                                                                null
                                                            ? "${historyData.reference}"
                                                            : "",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: Dimensions
                                                                .fontSizeExtraSmall),
                                                      ),
                                                      Text(
                                                        historyData.tanggal !=
                                                                null
                                                            ? "${historyData.weight}"
                                                            : "",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: Dimensions
                                                                .fontSizeExtraSmall),
                                                      ),
                                                      Text(
                                                        historyData.tanggal !=
                                                                null
                                                            ? "${historyData.total}"
                                                            : "",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: Dimensions
                                                                .fontSizeExtraSmall),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  );
                                },
                              ),
                              Obx(
                                () {
                                  return Column(
                                    children: controller.historyDataTotal
                                        .map(
                                          (historyDataTotal) => Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Container(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  historyDataTotal
                                                                              .total_amount !=
                                                                          null
                                                                      ? "Total :" +
                                                                          " " +
                                                                          "Rp ${historyDataTotal.total_amount}"
                                                                      : "",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Dimensions
                                                                              .fontSizeExtraSmall),
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                                Text(
                                                                  historyDataTotal
                                                                              .poin_reward !=
                                                                          null
                                                                      ? "Poin didapat :" +
                                                                          " " +
                                                                          "${historyDataTotal.poin_reward}"
                                                                      : "",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Dimensions
                                                                              .fontSizeExtraSmall),
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
