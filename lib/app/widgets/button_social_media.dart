import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../modules/contactUs/controllers/contactUs_controller.dart';

class ButtonSocialMedia extends StatelessWidget {
  const ButtonSocialMedia({
    key,
    this.contactcontroller,
    this.icon,
    this.url,
  }) : super(key: key);

  final ContactUsController contactcontroller;
  final String icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
      onTap: () => contactcontroller.launchURL(url),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeMedium),
        child: Image.asset(icon),
      ),
    );
  }
}
