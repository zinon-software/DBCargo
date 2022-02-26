import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/text_widget.dart';
import '../../tickets/flight_tickets_view.dart';

class FlyingButtonSearch extends StatelessWidget {
  final VoidCallback onTap;
  final String titel;
  const FlyingButtonSearch({Key? key, required this.onTap, required this.titel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.yellow,
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 36,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 221, 56, 15),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: textWidget(text: titel, colors: Colors.white),
        ),
      ),
    );
  }
}
