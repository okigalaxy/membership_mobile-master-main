import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
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
      body: ListView(
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
              // margin: EdgeInsets.only(top: 15.0),
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                color: Colors.white,
              ),
              // height: 180.0,
              child: Column(
                children: <Widget>[
                  Obx(
                    () {
                      if (controller.loading.value != false)
                        return Center(child: CircularProgressIndicator());
                      else if (controller.historyDataCust.isEmpty)
                        return Center(child: Text("Detail is Empty"));
                      else
                        return RefreshIndicator(
                          onRefresh: () async {
                            await Future.delayed(Duration(milliseconds: 800));
                            controller.historyCustInit();
                            controller.historyInit();
                            controller.historyTotalInit();
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                // height: 180,
                                height: 90,
                                child: ListView.builder(
                                  itemCount: controller.historyDataCust.length &
                                      controller.historyDataToko.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                Images.logoAbc,
                                                width: 60.0,
                                                height: 60.0,
                                              ),
                                              const SizedBox(
                                                  width: Dimensions
                                                      .paddingSizeSmall),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      Dimensions
                                                          .paddingSizeExtraSmall),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      // Text(
                                                      //   controller
                                                      //               .historyDataCust[
                                                      //                   index]
                                                      //               .sale_no !=
                                                      //           null
                                                      //       ? "No Sale : " +
                                                      //           "#${controller.historyDataCust[index].sale_no}"
                                                      //       : "",
                                                      //   style: TextStyle(
                                                      //       fontSize: Dimensions
                                                      //           .fontSizeExtraSmall),
                                                      //   maxLines: 1,
                                                      //   overflow: TextOverflow
                                                      //       .ellipsis,
                                                      // ),
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      // Text(
                                                      //   controller
                                                      //               .historyDataCust[
                                                      //                   index]
                                                      //               .paid !=
                                                      //           null
                                                      //       ? "Paid by : " +
                                                      //           "${controller.historyDataCust[index].paid}"
                                                      //       : "",
                                                      //   style: TextStyle(
                                                      //       fontSize: Dimensions
                                                      //           .fontSizeExtraSmall),
                                                      //   maxLines: 1,
                                                      //   overflow: TextOverflow
                                                      //       .ellipsis,
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // SizedBox(
                                          //   height: 65,
                                          //   child: Row(
                                          //     mainAxisAlignment:
                                          //         MainAxisAlignment
                                          //             .spaceBetween,
                                          //     children: [
                                          //       Expanded(
                                          //         child: Container(
                                          //           height: 100.0,
                                          //           child: Material(
                                          //             color: Colors.white,
                                          //             borderRadius: BorderRadius
                                          //                 .circular(Dimensions
                                          //                     .radiusDefault),
                                          //             child: InkWell(
                                          //               onTap: () {},
                                          //               child: Padding(
                                          //                 padding: EdgeInsets
                                          //                     .all(Dimensions
                                          //                         .paddingSizeMedium),
                                          //                 child: Column(
                                          //                   mainAxisAlignment:
                                          //                       MainAxisAlignment
                                          //                           .center,
                                          //                   children: <Widget>[
                                          //                     BarCodeImage(
                                          //                       params:
                                          //                           Code39BarCodeParams(
                                          //                         controller.historyDataCust[index]
                                          //                                     .paid !=
                                          //                                 null
                                          //                             ? "${controller.historyDataCust[index].sale_no}"
                                          //                             : "",
                                          //                         lineWidth:
                                          //                             2.0,
                                          //                         barHeight:
                                          //                             41.0,
                                          //                       ),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //           ),
                                          //           //
                                          //         ),
                                          //       ),
                                          //       SizedBox(
                                          //           width: Dimensions
                                          //               .paddingSizeDefault),
                                          //       Expanded(
                                          //         child: SizedBox(
                                          //           height: 100.0,
                                          //           child: Material(
                                          //             color: Colors.white,
                                          //             child: InkWell(
                                          //               onTap: () {},
                                          //               child: Center(
                                          //                 child: QrImage(
                                          //                   data: controller
                                          //                               .historyDataCust[
                                          //                                   index]
                                          //                               .nik !=
                                          //                           null
                                          //                       ? "${controller.historyDataCust[index].nik}"
                                          //                       : "",
                                          //                   eyeStyle:
                                          //                       const QrEyeStyle(
                                          //                     color:
                                          //                         Colors.black,
                                          //                     eyeShape:
                                          //                         QrEyeShape
                                          //                             .square,
                                          //                   ),
                                          //                   dataModuleStyle:
                                          //                       const QrDataModuleStyle(
                                          //                     dataModuleShape:
                                          //                         QrDataModuleShape
                                          //                             .square,
                                          //                     color:
                                          //                         Colors.black,
                                          //                   ),
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                    },
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          color: ColorResources.goldenColor,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "#",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: Dimensions.fontSizeExtraSmall),
                              ),
                              Text(
                                "Barang",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: Dimensions.fontSizeExtraSmall),
                              ),
                              Text(
                                "Berat",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: Dimensions.fontSizeExtraSmall),
                              ),
                              // Text(
                              //   "Price/Gram",
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       color: Colors.black,
                              //       fontSize: Dimensions.fontSizeExtraSmall),
                              // ),
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: Dimensions.fontSizeExtraSmall),
                              ),
                            ],
                          ),
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MaterialButton(
                                      color: Colors.white,
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            historyData.tanggal != null
                                                ? "${historyData.no}"
                                                : "",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: Dimensions
                                                    .fontSizeExtraSmall),
                                          ),
                                          Text(
                                            historyData.tanggal != null
                                                ? "${historyData.reference}"
                                                : "",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: Dimensions
                                                    .fontSizeExtraSmall),
                                          ),
                                          Text(
                                            historyData.tanggal != null
                                                ? "${historyData.weight}"
                                                : "",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: Dimensions
                                                    .fontSizeExtraSmall),
                                          ),
                                          // Text(
                                          //   historyData.tanggal != null
                                          //       ? "${historyData.total}"
                                          //       : "",
                                          //   style: TextStyle(
                                          //       color: Colors.black,
                                          //       fontSize: Dimensions
                                          //           .fontSizeExtraSmall),
                                          // ),
                                          Text(
                                            historyData.tanggal != null
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Text(
                                                historyDataTotal.total_amount !=
                                                        null
                                                    ? "Total :" +
                                                        " " +
                                                        "Rp ${historyDataTotal.total_amount}"
                                                    : "",
                                                style: TextStyle(
                                                    fontSize: Dimensions
                                                        .fontSizeExtraSmall),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 1, right: 13),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Text(
                                                historyDataTotal.poin_reward !=
                                                        null
                                                    ? "Poin didapat :" +
                                                        " " +
                                                        "${historyDataTotal.poin_reward}"
                                                    : "",
                                                style: TextStyle(
                                                    fontSize: Dimensions
                                                        .fontSizeExtraSmall),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Container(
                                    //   margin:
                                    //       EdgeInsets.only(top: 35, right: 10),
                                    //   child: Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       Align(
                                    //         alignment: Alignment.topRight,
                                    //         child: GestureDetector(
                                    //           onTap: () {},
                                    //           child: Text(
                                    //             historyDataTotal.user != null
                                    //                 ? "Create by :" +
                                    //                     " " +
                                    //                     "${historyDataTotal.user}"
                                    //                 : "",
                                    //             style: TextStyle(
                                    //               fontSize: 12,
                                    //               fontWeight: FontWeight.w200,
                                    //               color:
                                    //                   ColorResources.greyColor,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    // Container(
                                    //   margin:
                                    //       EdgeInsets.only(top: 2, right: 10),
                                    //   child: Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.end,
                                    //     children: [
                                    //       Align(
                                    //         alignment: Alignment.topRight,
                                    //         child: GestureDetector(
                                    //           onTap: () {},
                                    //           child: Text(
                                    //             historyDataTotal.date != null
                                    //                 ? "Date :" +
                                    //                     " " +
                                    //                     "${historyDataTotal.date}"
                                    //                 : "",
                                    //             style: TextStyle(
                                    //               fontSize: 12,
                                    //               fontWeight: FontWeight.w200,
                                    //               color:
                                    //                   ColorResources.greyColor,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
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
          ),
        ],
      ),
    );
  }
}
