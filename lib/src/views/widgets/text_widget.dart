import 'package:flutter/material.dart';

textWidget({String? text, Color? colors, double? size, FontWeight? fontWeight}) => Text(
        text!,
      maxLines: 1,

        style: TextStyle(color: colors, fontSize: size, fontWeight: fontWeight),
         overflow: TextOverflow.ellipsis,
      );

  line({height, width}) => Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      );