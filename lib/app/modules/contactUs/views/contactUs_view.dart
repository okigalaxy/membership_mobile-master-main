import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/contactUs_controller.dart';
import '../../../widgets/button_social_media.dart';

import '../../../utils/color_resource.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../../utils/text_resource.dart';
import 'package:flutter_svg/svg.dart';

class ContactUsView extends StatelessWidget {
  ContactUsView({key}) : super(key: key);

  final ContactUsController controller = Get.put(ContactUsController());

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
                                Images.iconContactUs,
                                color: ColorResources.primaryColor,
                                height: 35,
                                width: 35,
                              ),
                              const SizedBox(
                                  width: Dimensions.paddingSizeDefault),
                              const Text(
                                TextResource.contactUs,
                                style: TextStyle(
                                  color: ColorResources.primaryColor,
                                  fontSize: Dimensions.fontSizeExtraLarge,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 90),
              child: Obx(
                () {
                  if (controller.loading.value != false) {
                    return Center(child: CircularProgressIndicator());
                  } else if (controller.profileData.isEmpty) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        await Future.delayed(const Duration(milliseconds: 800));
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
                        controller.tokoInit();
                      },
                      child: ListView.builder(
                        padding:
                            const EdgeInsets.all(Dimensions.paddingSizeDefault),
                        itemCount: controller.tokoData.length &
                            controller.tokoData.length,
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
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      Dimensions.paddingSizeDefault),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            Images.logoAbc,
                                            width: 80.0,
                                            height: 50.0,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    controller.tokoData[index]
                                                                .toko !=
                                                            null
                                                        ? "${controller.tokoData[index].toko}"
                                                        : "",
                                                    style: TextStyle(
                                                      color: ColorResources
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 5),
                                            child: Icon(
                                              Icons.email,
                                              color: ColorResources.goldenColor,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  controller.tokoData[index]
                                                              .email !=
                                                          null
                                                      ? "${controller.tokoData[index].email}"
                                                      : "",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 5),
                                            child: Icon(
                                              Icons.phone,
                                              color: ColorResources.goldenColor,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  controller.tokoData[index]
                                                              .phone !=
                                                          null
                                                      ? "${controller.tokoData[index].phone}"
                                                      : "",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 5),
                                            child: Icon(
                                              Icons.add_location_alt_sharp,
                                              color: ColorResources.goldenColor,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  controller.tokoData[index]
                                                              .alamat !=
                                                          null
                                                      ? "${controller.tokoData[index].alamat}"
                                                      : "",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 25),
                                        child: Row(
                                          children: [
                                            const Text(
                                              TextResource.followUs,
                                              style: TextStyle(
                                                  color: ColorResources
                                                      .goldenColor,
                                                  fontSize:
                                                      Dimensions.fontSizeLarge,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                                height: Dimensions
                                                    .paddingSizeDefault),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ButtonSocialMedia(
                                                  contactcontroller: controller,
                                                  icon: Images.iconInstagram,
                                                  url: 'https://instagram.com',
                                                ),
                                                ButtonSocialMedia(
                                                  contactcontroller: controller,
                                                  icon: Images.iconFacebook,
                                                  url: 'https://facebook.com',
                                                ),
                                                ButtonSocialMedia(
                                                  contactcontroller: controller,
                                                  icon: Images.iconWhatsapp,
                                                  url: 'https://whatsapp.com',
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ButtonSocialMedia(
                                                  contactcontroller: controller,
                                                  icon: Images.iconTokopedia,
                                                  url:
                                                      'https://www.tokopedia.com',
                                                ),
                                                ButtonSocialMedia(
                                                  contactcontroller: controller,
                                                  icon: Images.iconShopee,
                                                  url: 'https://shopee.co.id',
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 25),
                                        child: InkWell(
                                          onTap: () => controller.launchURL(
                                              'https://www.termsfeed.com/live/aed34a4d-00c3-4499-aec3-16287c7a2d99'),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Image.asset(
                                                    Images.privacypolice,
                                                    width: 18,
                                                    height: 18,
                                                    color: ColorResources
                                                        .goldenColor),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "Kebijakan dan Privasi",
                                                  style: TextStyle(
                                                    color: ColorResources
                                                        .goldenColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
