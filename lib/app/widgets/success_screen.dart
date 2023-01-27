import 'package:flutter/material.dart';
import '../utils/color_resource.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    key,
    this.title,
    this.onTap,
    this.content,
  }) : super(key: key);

  final String title;
  final String content;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title != null ? title : "",
              style: const TextStyle(
                fontSize: Dimensions.fontSizeLarge,
                fontWeight: FontWeight.bold,
                color: ColorResources.blackColor,
              ),
            ),
            const SizedBox(height: 80.0),
            Image.asset(Images.iconSuccess, height: 190.0, width: 176.0),
            Text(
              content != null ? content : "",
              style: const TextStyle(
                fontSize: Dimensions.fontSizeLarge,
                fontWeight: FontWeight.bold,
                color: ColorResources.blackColor,
              ),
            ),
            const SizedBox(height: 130.0),
            SizedBox(
              height: 45.0,
              width: 100.0,
              child: ElevatedButton(
                onPressed: onTap,
                child: const Text("OK"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
