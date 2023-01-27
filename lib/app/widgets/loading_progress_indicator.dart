import 'package:flutter/material.dart';

class LoadingProgressIndicator extends StatelessWidget {
  const LoadingProgressIndicator({
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
