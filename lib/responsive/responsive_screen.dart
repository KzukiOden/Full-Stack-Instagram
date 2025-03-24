import 'package:flutter/material.dart';
import 'package:instagram_clone/utili/dimessions.dart';

class ResponsiveScreen extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget phoneScreenLayout;
  const ResponsiveScreen({
    super.key,
    required this.phoneScreenLayout,
    required this.webScreenLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > widthScreenSize) {
          // display web screen
          return webScreenLayout;
        } else {
          return phoneScreenLayout;
        }
        // if not make phonescreen
      },
    );
  }
}
