import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/images.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/color_resource.dart';
import '../controllers/history_reedem_controller.dart';

class HistoryReedemView extends GetView<HistoryReedemController> {
  HistoryReedemView({key}) : super(key: key);

  final HistoryReedemController controller = Get.put(HistoryReedemController());

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
                                Images.iconGift,
                                height: 35.0,
                                width: 35.0,
                                color: ColorResources.primaryColor,
                              ),
                              const SizedBox(
                                  width: Dimensions.paddingSizeDefault),
                              const Text(
                                "Riwayat Penukaran Poin",
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
                        //               // onSubmitted: controller.searchHistory,
                        //               // onChanged: controller.searchHistory,
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
                  } else if (controller.reedemData.isEmpty) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        await Future.delayed(const Duration(milliseconds: 800));
                        controller.reedemInit();
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
                        controller.reedemInit();
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        itemCount: controller.reedemData.length,
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
                                // onTap: () => Get.to(
                                //   () => HistoryDetailView(),
                                //   arguments: {
                                //     'tanggal': controller
                                //                 .reedemDataCurrent[index]
                                //                 .tanggal !=
                                //             null
                                //         ? controller
                                //             .reedemDataCurrent[index].tanggal
                                //         : "",
                                //   },
                                // ),
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
                                            controller.reedemData[index].item !=
                                                    null
                                                ? "${controller.reedemData[index].item}"
                                                : "",
                                            style: TextStyle(
                                              color:
                                                  ColorResources.primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            controller.reedemData[index]
                                                        .tanggal !=
                                                    null
                                                ? "${controller.reedemData[index].tanggal}"
                                                : "",
                                            style: const TextStyle(
                                              color: ColorResources.greyColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: CachedNetworkImage(
                                              imageUrl: controller
                                                          .reedemData[index]
                                                          .image !=
                                                      null
                                                  ? "${controller.reedemData[index].image}"
                                                  : "",
                                              height: 50.0,
                                              width: 50.0,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) => Icon(
                                                      Icons.error,
                                                      color: Colors.red),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  Dimensions.paddingSizeSmall),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    controller.reedemData[index]
                                                                .sisa_poin !=
                                                            null
                                                        ? "Sisa Poin" +
                                                            " ${controller.reedemData[index].sisa_poin}"
                                                        : "",
                                                    style: TextStyle(
                                                      color: ColorResources
                                                          .greyColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: Dimensions
                                                          .fontSizeSmall,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Text(
                                                    controller.reedemData[index]
                                                                .poin !=
                                                            null
                                                        ? "${controller.reedemData[index].poin}" +
                                                            " Poin"
                                                        : "",
                                                    style: TextStyle(
                                                      color: ColorResources
                                                          .goldenColor,
                                                      fontSize: Dimensions
                                                          .fontSizeLarge,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // margin: EdgeInsets.only(top: 5),
                                            child: SvgPicture.asset(
                                              Images.iconGift,
                                              height: 30.0,
                                              width: 30.0,
                                              color:
                                                  ColorResources.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
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
