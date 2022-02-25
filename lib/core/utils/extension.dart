import 'package:dog_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension DebugBorder on Widget {
  Widget get debugBorder {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 237, 176, 144))),
      child: this,
    );
  }
}
