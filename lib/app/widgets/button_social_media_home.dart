import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../modules/home/controllers/home_controller.dart';

class ButtonSocialMedia extends StatelessWidget {
  const ButtonSocialMedia({
    key,
    this.controller,
    this.icon,
    this.url,
  }) : super(key: key);

  final HomeController controller;
  final String icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
      onTap: () => controller.launchURL(url),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeMedium),
        child: Image.asset(icon),
      ),
    );
  }
}
