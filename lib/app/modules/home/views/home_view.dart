import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:membership/app/modules/history/history/views/history_view.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:membership/app/modules/qr_code/views/qr_view.dart';
import 'package:membership/app/modules/detail_banner/views/detail_banner_view.dart';
import 'package:membership/app/modules/history/history_reedem/views/history_reedem_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controllers/home_controller.dart';
import '../../../utils/images.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/text_resource.dart';
import '../../../utils/color_resource.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.loading.value != false) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.homeData.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(milliseconds: 800));
                controller.homeInit();
                controller.newsInit();
                controller.tokoInit();
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
                        Container(
                          child: Column(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(
                                      () {
                                        _currentIndex = index;
                                      },
                                    );
                                  },
                                ),
                                items: controller.newsData
                                    .map(
                                      (item) => Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Card(
                                          margin: EdgeInsets.only(
                                            top: 10.0,
                                            bottom: 5.0,
                                          ),
                                          elevation: 6.0,
                                          shadowColor: Colors.redAccent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.0),
                                            ),
                                            child: Stack(
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: () => Get.to(
                                                    () => DetailBannerView(),
                                                    arguments: {
                                                      'id': item.id != null
                                                          ? item.id
                                                          : "",
                                                    },
                                                  ),
                                                  child: Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8.0),
                                                      ),
                                                      child: Image.network(
                                                        item.image,
                                                        fit: BoxFit.cover,
                                                        height: 200.0,
                                                        width: 328.0,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: controller.newsData.map((urlOfItem) {
                                  int index =
                                      controller.newsData.indexOf(urlOfItem);
                                  return Container(
                                    width: 5.0,
                                    height: 5.0,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentIndex == index
                                          ? Color.fromRGBO(0, 0, 0, 0.8)
                                          : Color.fromRGBO(0, 0, 0, 0.3),
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: Dimensions.paddingSizeExtraSmall),
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
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
                                                                  .kode_member !=
                                                              null
                                                          ? "${controller.homeData[index].kode_member}"
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
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
