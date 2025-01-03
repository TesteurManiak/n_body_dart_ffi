import 'package:flutter/material.dart';

class DartIcon extends StatelessWidget {
  const DartIcon({this.size = 48, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Image.asset('assets/dart.png', width: size),
    );
  }
}
