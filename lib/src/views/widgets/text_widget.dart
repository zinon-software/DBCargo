import 'package:flutter/material.dart';

textWidget({String? text, Color? colors, double? size}) => Text(
        text!,
        style: TextStyle(color: colors, fontSize: size),
      );

  line({height, width}) => Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      );