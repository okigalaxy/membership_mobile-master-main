import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    key,
    this.press,
    this.title,
    this.isLoading,
  }) : super(key: key);

  final String title;
  final bool isLoading;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading == true ? null : press,
        child: isLoading == true
            ? const Center(
                child: SizedBox(
                  height: 18.0,
                  width: 18.0,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : Text(title.tr),
      ),
    );
  }
}
