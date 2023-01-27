import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/images.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/text_resource.dart';
import '../../../../utils/color_resource.dart';
import '../controllers/history_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../history_detail/views/history_detail_view.dart';

class HistoryView extends GetView<HistoryController> {
  HistoryView({key}) : super(key: key);

  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            SizedBox(height: 42.0),
            Positioned(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                              Dimensions.paddingSizeDefault),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Images.iconHistory,
                                color: ColorResources.primaryColor,
                              ),
                              const SizedBox(
                                  width: Dimensions.paddingSizeDefault),
                              const Text(
                                TextResource.purchase,
                                style: TextStyle(
                                  color: ColorResources.primaryColor,
                                  fontSize: Dimensions.fontSizeExtraLarge,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: Dimensions.paddingSizeDefault),
                        //       child: Row(
                        //         children: [
                        //           Expanded(
                        //             child: CupertinoSearchTextField(
                        //               backgroundColor: Colors.white,
                        //               onSubmitted: controller.searchHistory,
                        //               onChanged: controller.searchHistory,
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //               width: Dimensions.paddingSizeSmall),
                        //           ElevatedButton.icon(
                        //             onPressed: () {},
                        //             icon: const Icon(Icons.filter_list),
                        //             label: const Text('Filter'),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Obx(
                () {
                  if (controller.loading.value != false) {
                    return Center(child: CircularProgressIndicator());
                  } else if (controller.historyData.isEmpty) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        await Future.delayed(const Duration(milliseconds: 800));
                        controller.historyInit();
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
                        controller.historyInit();
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        itemCount: controller.historyData.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 15),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 236, 233, 233),
                                  spreadRadius: 0,
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusDefault),
                              child: InkWell(
                                onTap: () => Get.to(
                                  () => HistoryDetailView(),
                                  arguments: {
                                    'date':
                                        controller.historyData[index].date !=
                                                null
                                            ? controller.historyData[index].date
                                            : "",
                                  },
                                ),
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      Dimensions.paddingSizeDefault),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.historyData[index]
                                                        .invoice !=
                                                    null
                                                ? "${controller.historyData[index].invoice}"
                                                : "",
                                            style: TextStyle(
                                              color:
                                                  ColorResources.primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            controller.historyData[index]
                                                        .tanggal !=
                                                    null
                                                ? "${controller.historyData[index].tanggal}"
                                                : "",
                                            style: const TextStyle(
                                              color: ColorResources.greyColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    controller
                                                                .historyData[
                                                                    index]
                                                                .total_transaksi !=
                                                            null
                                                        ? "${controller.historyData[index].total_transaksi}"
                                                        : "",
                                                    style: TextStyle(
                                                      color: ColorResources
                                                          .goldenColor,
                                                      fontSize: Dimensions
                                                          .fontSizeExtraLarge,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: GoogleFonts
                                                              .portLligatSans()
                                                          .fontFamily,
                                                    ),
                                                  ),
                                                  RichText(
                                                    text: const TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: " " +
                                                              TextResource
                                                                  .items,
                                                          style: TextStyle(
                                                            fontSize: Dimensions
                                                                .fontSizeDefault,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: ColorResources
                                                                .goldenColor,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                controller.historyData[index]
                                                            .poin_reward !=
                                                        null
                                                    ? "Poin" +
                                                        " ${controller.historyData[index].poin_reward}"
                                                    : "",
                                                style: TextStyle(
                                                  color:
                                                      ColorResources.greyColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      Dimensions.fontSizeSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                              width: Dimensions
                                                  .paddingSizeExtraLarge),
                                          Expanded(
                                            child: Text(
                                              controller.historyData[index]
                                                          .total_belanja !=
                                                      null
                                                  ? "Rp " +
                                                      "${controller.historyData[index].total_belanja}"
                                                  : "",
                                              style: const TextStyle(
                                                color: ColorResources.greyColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: Dimensions
                                                    .fontSizeExtraLarge,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
