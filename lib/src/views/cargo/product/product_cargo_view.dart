import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../widgets/switch_widget.dart';
import '../../trips/home_trips/components/flying_button_search.dart';
import '../../utilities/themeStyles.dart';
import '../../widgets/dropDown.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF64B5F6),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: <Widget>[
            const Text(
              "NYC",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: 8,
                width: 8,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.indigo.shade400,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 24,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Flex(
                            children: List.generate(
                                (constraints.constrainWidth() / 6).floor(),
                                (index) => SizedBox(
                                      height: 1,
                                      width: 3,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300),
                                      ),
                                    )),
                            direction: Axis.horizontal,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          );
                        },
                      ),
                    ),
                    Center(
                        child: Transform.rotate(
                      angle: 1.5,
                      child: Icon(
                        Icons.local_airport,
                        color: Colors.indigo.shade300,
                        size: 24,
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: 8,
                width: 8,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.pink.shade400,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Text(
              "BAS",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: Color(0xFF64B5F6),
              ),
              child: Container(
                height: 35,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),
                  ),
                ),
                child: const Text(
                  "Product details",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  TextFormField(
                    cursorColor: Theme.of(context).cursorColor,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      labelText: "product link",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(),
                      ),
                      icon: const Icon(
                        Icons.paste,
                      ),
                      suffixIcon: const Icon(Icons.link),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "product name",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "name cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Product quantity",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Row(
                          children: [
                            if (1 >= 1)
                              MaterialButton(
                                minWidth: 60,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF64B5F6),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14))),
                                  child: const Text(
                                    '—',
                                  ),
                                ),
                                onPressed: () {},
                              )
                            else
                              const SizedBox(
                                width: 20,
                              ),
                            const Text("1"),
                            MaterialButton(
                              minWidth: 60,
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF64B5F6),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14))),
                                  child: const Text('+')),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    // height: 12,
                    margin: const EdgeInsets.only(left: 30),
                    child: const Text("single item price"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          initialValue: '10.0',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(),
                            ),
                            suffixIcon: const Icon(FontAwesomeIcons.dollarSign),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text("Total (5)"),
                    ],
                  ),
                   Container(
                    margin: const EdgeInsets.only(left: 30, top: 10),
                    child: const Text("single item weight"),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: Theme.of(context).cursorColor,
                          initialValue: '1.0',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(),
                            ),
                            suffixIcon: const Icon(FontAwesomeIcons.weight),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text("Total (5)"),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Category: ', style: ThemeStyles.dropDownTextStyle),
                      const SizedBox(width: 10.0),
                      Expanded(child: DropDown('food'))
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text("Shipment Pictures"),
                  const SizedBox(height: 12),
                  Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: const Color(0xFF64B5F6)),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Color(0xFF64B5F6),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Nonstop(titel: "Save to Wishlist"),
                  const SizedBox(height: 12),
                  FlyingButtonSearch(
                    titel: "DONE",
                    onTap: () => Get.back(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
