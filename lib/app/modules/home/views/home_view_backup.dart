import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:membership/app/modules/history/history/views/history_view.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:membership/app/modules/point/views/point_view.dart';
import 'package:membership/app/modules/qr_code/views/qr_view.dart';
import 'package:membership/app/modules/detail_banner/views/detail_banner_view.dart';
import 'package:membership/app/modules/history/history_reedem/views/history_reedem_view.dart';
import 'package:flutter_svg/svg.dart';

import '../controllers/home_controller.dart';
import '../../../widgets/button_social_media_home.dart';

import '../../../utils/images.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/text_resource.dart';
import '../../../utils/color_resource.dart';

class HomeView1 extends StatelessWidget {
  HomeView1({key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.loading.value != false)
            return Center(child: CircularProgressIndicator());
          else if (controller.homeData.isEmpty)
            return Center(child: Text("Data is Empty"));
          else
            return RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(milliseconds: 800));
                controller.homeInit();
                controller.newsInit();
                controller.tokoInit();
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                itemCount:
                    controller.homeData.length & controller.tokoData.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        const SizedBox(height: Dimensions.paddingSizeDefault),
                        Row(
                          children: [
                            Image.asset(
                              Images.logoAbc,
                              width: 100.0,
                              height: 100.0,
                            ),
                            const SizedBox(
                                width: Dimensions.paddingSizeDefault),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    Dimensions.paddingSizeSmall),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      controller.tokoData[index].toko != null
                                          ? "${controller.tokoData[index].toko}"
                                          : "",
                                      style: TextStyle(
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      controller.tokoData[index].phone != null
                                          ? "${controller.tokoData[index].phone}"
                                          : "",
                                      style: TextStyle(
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      controller.tokoData[index].email != null
                                          ? "${controller.tokoData[index].email}"
                                          : "",
                                      style: TextStyle(
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      controller.tokoData[index].alamat != null
                                          ? "${controller.tokoData[index].alamat}"
                                          : "",
                                      style: TextStyle(
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => controller.signOut(),
                              child: const Text(TextResource.logout),
                            ),
                          ],
                        ),
                        const SizedBox(height: Dimensions.paddingSizeDefault),
                        Row(
                          children: [
                            Text(
                              TextResource.hallo,
                              style: TextStyle(
                                color: ColorResources.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.fontSizeLarge,
                              ),
                            ),
                            const SizedBox(width: 0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    controller.homeData[index].nama != null
                                        ? "${controller.homeData[index].nama}"
                                        : "",
                                    style: TextStyle(
                                      fontSize: Dimensions.fontSizeLarge,
                                      fontWeight: FontWeight.w600,
                                      color: ColorResources.goldenColor,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          // height: 132,
                          height: 230,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.newsData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () => Get.to(
                                          () => DetailBannerView(),
                                          arguments: {
                                            'id': controller
                                                        .newsData[index].id !=
                                                    null
                                                ? controller.newsData[index].id
                                                : "",
                                          },
                                        ),
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: controller
                                                          .newsData[index]
                                                          .image !=
                                                      null
                                                  ? "${controller.newsData[index].image}"
                                                  : "",
                                              // height: 100.0,
                                              // width: 328.0,
                                              height: 200.0,
                                              width: 328.0,
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
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(
                            height: Dimensions.paddingSizeExtraSmall),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusDefault),
                            color: ColorResources.primaryColor,
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(
                                    Dimensions.paddingSizeExtraLarge),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          Images.logoAbcPutih,
                                          width: 70.0,
                                        ),
                                        Text(
                                          controller.homeData[index]
                                                      .member_since !=
                                                  null
                                              ? TextResource.memberSince +
                                                  ' ' +
                                                  "${controller.homeData[index].member_since}"
                                              : "",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.fontSizeSmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      controller.homeData[index]
                                                                  .nama !=
                                                              null
                                                          ? "${controller.homeData[index].nama}"
                                                          : "",
                                                      style: TextStyle(
                                                        color: ColorResources
                                                            .goldenColor,
                                                        fontSize: Dimensions
                                                            .fontSizeOverLarge,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      controller.homeData[index]
                                                                  .nik !=
                                                              null
                                                          ? "${controller.homeData[index].nik}"
                                                          : "",
                                                      style: TextStyle(
                                                        fontSize: Dimensions
                                                            .fontSizeLarge,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: ColorResources
                                                            .goldenColor,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 60.0,
                                          child: Material(
                                            color: ColorResources.primaryColor,
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radiusDefault),
                                            child: InkWell(
                                              onTap: () =>
                                                  Get.to(() => QrView()),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radiusDefault),
                                              child: Center(
                                                child: QrImage(
                                                  data: controller
                                                              .homeData[index]
                                                              .kode_verifikasi !=
                                                          null
                                                      ? "${controller.homeData[index].kode_verifikasi}"
                                                      : "",
                                                  eyeStyle: const QrEyeStyle(
                                                    color: Colors.white,
                                                    eyeShape: QrEyeShape.square,
                                                  ),
                                                  dataModuleStyle:
                                                      const QrDataModuleStyle(
                                                    dataModuleShape:
                                                        QrDataModuleShape
                                                            .square,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                        Dimensions.radiusDefault),
                                    bottomRight: Radius.circular(
                                        Dimensions.radiusDefault),
                                  ),
                                  color: ColorResources.goldenColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      Dimensions.paddingSizeDefault),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          controller.homeData[index].email !=
                                                  null
                                              ? "${controller.homeData[index].email}"
                                              : "",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Dimensions.fontSizeSmall,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        TextResource.lifetimeMembership,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Dimensions.paddingSizeDefault),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusDefault),
                                  color: ColorResources.primaryColor,
                                ),
                                height: 53.0,
                                child: Material(
                                  color: ColorResources.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusDefault),
                                  child: InkWell(
                                    onTap: () =>
                                        Get.to(() => HistoryReedemView()),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          Dimensions.paddingSizeExtraSmall),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            controller.homeData[index].poin !=
                                                    null
                                                ? "${controller.homeData[index].poin}"
                                                : "",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  Dimensions.fontSizeExtraLarge,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            TextResource.pointRewards,
                                            style: TextStyle(
                                              color: ColorResources.goldenColor,
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                            ),
                                          ),
                                          // Text(
                                          //   controller.homeData[index].poin !=
                                          //           null
                                          //       ? "${controller.homeData[index].poin}"
                                          //       : "",
                                          //   style: TextStyle(
                                          //     color: Colors.white,
                                          //     fontWeight: FontWeight.w500,
                                          //     fontSize: 35.0,
                                          //     // fontSize: 80.0,
                                          //   ),
                                          //   maxLines: 1,
                                          //   overflow: TextOverflow.ellipsis,
                                          // ),
                                          // Text(
                                          //   TextResource.pointRewards,
                                          //   style: TextStyle(
                                          //     color: ColorResources.goldenColor,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //
                              ),
                            ),
                            SizedBox(width: Dimensions.paddingSizeDefault),
                            Expanded(
                              child: SizedBox(
                                height: 53.0,
                                child: Material(
                                  color: ColorResources.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusDefault),
                                  child: InkWell(
                                    onTap: () => Get.to(() => HistoryView()),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault),
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          Dimensions.paddingSizeSmall),
                                      child: Container(
                                        // margin: EdgeInsets.only(top: 40),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              TextResource.purchase,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            // SvgPicture.asset(
                                            //   Images.iconHistory,
                                            //   color: Colors.white,
                                            // ),
                                            // Text(
                                            //   TextResource.history,
                                            //   style: TextStyle(
                                            //     color: Colors.white,
                                            //     fontSize: Dimensions
                                            //         .fontSizeOverLarge,
                                            //     fontWeight: FontWeight.w500,
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: Get.size.height / 25),
                        // Column(
                        //   children: [
                        //     Container(
                        //       child: Row(
                        //         children: [
                        //           const Text(
                        //             TextResource.followUs,
                        //             style: TextStyle(
                        //               color: ColorResources.goldenColor,
                        //               fontSize: Dimensions.fontSizeLarge,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Container(
                        //       child: Column(
                        //         children: [
                        //           const SizedBox(
                        //               height: Dimensions.paddingSizeLarge),
                        //           Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceEvenly,
                        //             children: [
                        //               ButtonSocialMedia(
                        //                 controller: controller,
                        //                 icon: Images.iconInstagram,
                        //                 url: 'https://instagram.com',
                        //               ),
                        //               ButtonSocialMedia(
                        //                 controller: controller,
                        //                 icon: Images.iconFacebook,
                        //                 url: 'https://facebook.com',
                        //               ),
                        //               ButtonSocialMedia(
                        //                 controller: controller,
                        //                 icon: Images.iconWhatsapp,
                        //                 url: 'https://whatsapp.com',
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                },
              ),
            );
        },
      ),
      // floatingActionButton: Container(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       ButtonSocialMedia(
      //         controller: controller,
      //         icon: Images.iconWhatsapp,
      //         url: 'https://whatsapp.com',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
