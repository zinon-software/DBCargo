import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ticket_detail/ticket_detail_view.dart';

class FlightTickets extends StatefulWidget {
  const FlightTickets({Key? key}) : super(key: key);

  @override
  _FlightTicketsState createState() => _FlightTicketsState();
}

class _FlightTicketsState extends State<FlightTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF64B5F6),
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
              "SFO",
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
          children: [
            Container(
              height: 160,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: Color(0xFF64B5F6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "12 Sep - 15 Sep",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "1 Adult, Economy",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 35,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "18 Search Resulte",
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(Icons.filter_list),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TicketView(),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class TicketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => TicketDetailView()),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Column(
                children: <Widget>[
                  Row(
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
                                          (constraints.constrainWidth() / 6)
                                              .floor(),
                                          (index) => SizedBox(
                                                height: 1,
                                                width: 3,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300),
                                                ),
                                              )),
                                      direction: Axis.horizontal,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                        "SFO",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      SizedBox(
                          width: 100,
                          child: Text(
                            "NewYork",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )),
                      Text(
                        "6H 30M",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                          width: 100,
                          child: Text(
                            "SanFransisco",
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        "08:00 AM",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "02:30 PM",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "1 May 2022",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Row(
                        children: const <Widget>[
                          Text(
                            "Flight No : ",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            "23",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: const Radius.circular(10)),
                          color: Colors.grey.shade200),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Flex(
                            children: List.generate(
                                (constraints.constrainWidth() / 10).floor(),
                                (index) => SizedBox(
                                      height: 1,
                                      width: 5,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade400),
                                      ),
                                    )),
                            direction: Axis.horizontal,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: Colors.grey.shade200),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Icon(Icons.flight_land, color: Colors.amber),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text("Jet Airways",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                  const Expanded(
                      child: Text("\u0024 240",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
