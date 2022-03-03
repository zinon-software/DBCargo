import 'package:flutter/material.dart';

import 'text_widget.dart';

class Nonstop extends StatefulWidget {
  final String titel; 
  const Nonstop({Key? key, required this.titel}) : super(key: key);

  @override
  State<Nonstop> createState() => _NonstopState();
}

class _NonstopState extends State<Nonstop> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textWidget(
          text: widget.titel,
          colors: Colors.black,
        ),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
          activeTrackColor: const Color.fromARGB(255, 221, 56, 15),
          activeColor: Colors.white,
        ),
      ],
    );
  }
}
