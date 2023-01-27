import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBottomNavBarItem extends StatelessWidget {
  const IconBottomNavBarItem({
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
        height: 24.0,
        width: 24.0,
        color: Colors.grey,
      ),
    );
  }
}
