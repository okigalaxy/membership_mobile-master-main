import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:membership/app/modules/dashboard/views/dashboard_view.dart';

import 'package:flutter_svg/svg.dart';
import '../controllers/list_reward_controller.dart';
import '../../../utils/color_resource.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/text_resource.dart';
import '../../../utils/images.dart';

class ListRewardView extends GetView<ListRewardController> {
  ListRewardView({key}) : super(key: key);
  final ListRewardController controller = Get.put(ListRewardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.loading.value != false) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.homeData.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 800));
              controller.homeInit();
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
              controller.homeInit();
              controller.reedemInit();
            },
            child: ListView(
              children: [
                Container(
                  child: Material(
                    color: ColorResources.primaryColor,
                    child: Padding(
                      padding:
                          const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      child: Column(
                        children: [
                          Obx(
                            () {
                              return Column(
                                children: controller.homeData
                                    .map(
                                      (home) => Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              home.poin != null
                                                  ? "${home.poin}"
                                                  : "",
                                              style: TextStyle(
                                                color:
                                                    ColorResources.goldenColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 60.0,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              TextResource.pointRewards,
                                              style: TextStyle(
                                                  color: ColorResources
                                                      .goldenColor,
                                                  fontSize: 18),
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
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            Images.iconGift,
                            height: 25.0,
                            width: 25.0,
                            color: ColorResources.primaryColor,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              TextResource.rewardList,
                              style: TextStyle(
                                color: ColorResources.primaryColor,
                                fontSize: Dimensions.fontSizeLarge,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Obx(
                          () {
                            return Column(
                              children: controller.reedemData
                                  .map(
                                    (reedem) => Container(
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                255, 236, 233, 233),
                                            spreadRadius: 0,
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                      ),
                                      child: Material(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault),
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              Dimensions.paddingSizeDefault),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl: reedem
                                                                    .image !=
                                                                null
                                                            ? "${reedem.image}"
                                                            : "",
                                                        height: 55.0,
                                                        width: 55.0,
                                                        fit: BoxFit.cover,
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error,
                                                                color:
                                                                    Colors.red),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 15.0),
                                                        child: Text(
                                                          reedem.item != null
                                                              ? "${reedem.item}"
                                                              : "",
                                                          style: TextStyle(
                                                            color: ColorResources
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        reedem.reedem_point !=
                                                                null
                                                            ? "${reedem.reedem_point}"
                                                            : "",
                                                        style: const TextStyle(
                                                            color: ColorResources
                                                                .goldenColor,
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child: Text(
                                                          "Point",
                                                          style: const TextStyle(
                                                              color:
                                                                  ColorResources
                                                                      .greyColor,
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      )
                    ],
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
