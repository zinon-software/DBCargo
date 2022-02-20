import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../controllers/searsh_controller.dart';
import '../../../widgets/catgeory_widget.dart';
import '../../../widgets/text_widget.dart';

class ClassCabina extends StatelessWidget {
  ClassCabina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearshController appState = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(text: "Class"),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FaIcon(
              FontAwesomeIcons.chair,
              size: 20,
              color: Colors.black26,
            ),
            textWidget(text: "Economy", colors: Colors.black26),
            const SizedBox(width: 15),
            const Icon(
              Icons.chair_alt,
              color: Colors.black,
            ),
            textWidget(text: "Business", colors: Colors.black),
            const SizedBox(width: 15),
            const Icon(
              Icons.chair,
              color: Colors.black26,
            ),
            textWidget(text: "First", colors: Colors.black26),
          ],
        ),
      ],
    );
  }
}
