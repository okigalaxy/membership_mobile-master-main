import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../utils/color_resource.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../controllers/qr_controller.dart';

class QrView extends GetView<QrController> {
  QrView({key}) : super(key: key);
  final QrController controller = Get.put(QrController());

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
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                itemCount: controller.homeData.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 20,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text(
                                "Kembali",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            Images.logoAbc,
                            height: 50,
                          ),
                        ),
                        QrImage(
                          data: controller.homeData[index].kode_verifikasi !=
                                  null
                              ? "${controller.homeData[index].kode_verifikasi}"
                              : "",
                          eyeStyle: const QrEyeStyle(
                            color: Colors.black,
                            eyeShape: QrEyeShape.square,
                          ),
                          dataModuleStyle: const QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: Colors.black,
                          ),
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
