import 'package:flutter/material.dart';
import 'package:n_body_dart_ffi/widgets/dart_icon.dart';
import 'package:n_body_dart_ffi/widgets/unknown_icon.dart';

enum Method {
  dart('Dart'),
  dartNative('Dart "Native"'),
  experiment('???');

  const Method(this.methodName);

  final String methodName;

  Widget methodIcon() {
    switch (this) {
      case Method.dart:
      case Method.dartNative:
        return DartIcon();
      case Method.experiment:
        return UnknownIcon();
    }
  }
}
