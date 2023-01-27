import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../controllers/detail_banner_controller.dart';

import '../../../utils/images.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/color_resource.dart';

class DetailBannerView extends StatelessWidget {
  DetailBannerView({key}) : super(key: key);

  final DetailBannerController controller = Get.put(DetailBannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.loading.value != false) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.newsdetailData.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 800));
              controller.newsDetailInit();
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
              controller.newsDetailInit();
            },
            child: ListView(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              children: [
                Obx(
                  () {
                    return Column(
                      children: controller.newsdetailData
                          .map(
                            (news) => Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  const SizedBox(
                                      height: Dimensions.paddingSizeDefault),
                                  Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () =>
                                              Navigator.of(context).pop(false),
                                          child: SvgPicture.asset(
                                            Images.iconBack,
                                            color: ColorResources.primaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                Dimensions.paddingSizeDefault),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                Bidi.stripHtmlIfNeeded(
                                                  news.judul != null
                                                      ? "${news.judul}"
                                                      : "",
                                                ),
                                                style: TextStyle(
                                                  color: ColorResources
                                                      .primaryColor,
                                                  fontSize: Dimensions
                                                      .fontSizeExtraLarge,
                                                  fontWeight: FontWeight.w600,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: news.image != null
                                            ? "${news.image}"
                                            : "",
                                        height: 160.0,
                                        width: 328.0,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error,
                                                color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeDefault),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              Bidi.stripHtmlIfNeeded(
                                                news.isi != null
                                                    ? "${news.isi}"
                                                    : "",
                                              ),
                                              style: TextStyle(
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                                color:
                                                    ColorResources.primaryColor,
                                                fontWeight: FontWeight.w500,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 10,
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
          );
        }
      }),
    );
  }
}
