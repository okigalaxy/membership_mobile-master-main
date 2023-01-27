import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/color_resource.dart';

class ActiveIconBottomNavBarItem extends StatelessWidget {
  const ActiveIconBottomNavBarItem({
    key,
    this.icon,
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SvgPicture.asset(
        icon,
        height: 26.0,
        width: 26.0,
        color: ColorResources.primaryColor,
      ),
    );
  }
}
