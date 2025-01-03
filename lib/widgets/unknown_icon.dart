import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UnknownIcon extends StatelessWidget {
  const UnknownIcon({this.size = 48, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Icon(MdiIcons.testTube, size: size),
    );
  }
}
