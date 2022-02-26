import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../trips/home_trips/components/flight_nonstop.dart';
import '../../trips/home_trips/components/flying_button_search.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        // elevation: 0,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("تفاصسل المنتج"),
              SizedBox(height: 12),
              TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                initialValue: 'Input text',
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  icon: Icon(Icons.link),
                  suffixIcon: Icon(
                    Icons.paste,
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Cargo Name",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Email cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "title",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14))),
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
                        Text("1"),
                        MaterialButton(
                          minWidth: 60,
                          child: Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF64B5F6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14))),
                              child: const Text('+')),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      initialValue: 'Input text',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(FontAwesomeIcons.dollarSign),
                      ),
                    ),
                  ),
                  Text("المجموع (5)"),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(FontAwesomeIcons.weight),
                      ),
                    ),
                  ),
                  Text("المجموع (5)"),
                ],
              ),
              SizedBox(height: 12),
              Text("الفئة"),
              SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Cargo Name",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Email cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 12),
              Text("صور الشحنة"),
              SizedBox(height: 12),
              Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: const Color(0xFF64B5F6)),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Color(0xFF64B5F6),
                ),
              ),
              SizedBox(height: 12),
              Nonstop(),
              SizedBox(height: 12),
              FlyingButtonSearch(
                titel: "Favorite",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
