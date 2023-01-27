import 'package:flutter/material.dart';

class StyleAppBar extends StatelessWidget {
  const StyleAppBar({key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEDEDED),
              blurRadius: 12.0,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
