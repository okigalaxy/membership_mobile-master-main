import 'package:flutter/material.dart';

import 'package:membership/app/utils/images.dart';
import '../../../../utils/text_resource.dart';
import '../../../../utils/color_resource.dart';

class LogoCompany extends StatelessWidget {
  const LogoCompany({
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Image.asset(
            Images.logoAbc,
            width: 238,
            height: 150,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "PT. Abadi Bintang Cemerlang Mandiri",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: ColorResources.primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
