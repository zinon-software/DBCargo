import 'package:carousel_slider/carousel_slider.dart';
import 'package:dpcargo/src/views/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../controllers/onboarding_controller.dart';
import '../../../controllers/trip_controller.dart';
import '../../trips/home_trips/components/flight_airport.dart';
import '../../trips/home_trips/components/flying_button_search.dart';
import '../../trips/tickets/flight_tickets_view.dart';
import '../../widgets/pickDate_widget.dart';
import '../../widgets/text_widget.dart';
import '../favorite/favorite_cargo_view.dart';
import '../product/product_cargo_view.dart';

class HomeCargoView extends StatefulWidget {
  const HomeCargoView({Key? key}) : super(key: key);

  @override
  State<HomeCargoView> createState() => _HomeCargoViewState();
}

class _HomeCargoViewState extends State<HomeCargoView> {
  bool valueChek = false;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final SearshController appState = Get.find();

    final OnBoardingControlller onBoardingControlller =
        Get.put(OnBoardingControlller());

    Widget onboardingItem(int item) {
      if (item == 1) {
        return onePage(context, appState);
      } else if (item == 2) {
        return twoPage();
      } else {
        return threePage();
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF64B5F6),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height - 450,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/world_maps.png'),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 500,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: onBoardingControlller.getCurrentIndex == 0
                                  ? Colors.orange
                                  : kSubtitleColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: onBoardingControlller.getCurrentIndex == 1
                                  ? Colors.orange
                                  : kSubtitleColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: onBoardingControlller.getCurrentIndex == 2
                                  ? Colors.orange
                                  : kSubtitleColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  height: 500,
                  width: MediaQuery.of(context).size.width,

                  child: Obx(
                    () => Center(
                      child: Stack(
                        children: [
                          CarouselSlider(
                            items: [1, 2, 3]
                                .map((item) => onboardingItem(item))
                                .toList(),
                            options: CarouselOptions(
                              initialPage:
                                  onBoardingControlller.getCurrentIndex,
                              height: double.infinity,
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                onBoardingControlller.setCurrentIndex(index);
                              },
                            ),
                            carouselController: carouselController,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  onBoardingControlller.getCurrentIndex == 0
                                      ? const SizedBox()
                                      : MaterialButton(
                                          onPressed: () {
                                            (onBoardingControlller
                                                        .getCurrentIndex !=
                                                    0)
                                                ? carouselController
                                                    .previousPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.linear)
                                                : null;
                                          },
                                          child: Row(
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Text(
                                                  "←",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                              Text("Bake"),
                                            ],
                                          ),
                                        ),
                                  onBoardingControlller.getCurrentIndex == 2
                                      ? MaterialButton(
                                          onPressed: () {},
                                          child: const Text("Finish"))
                                      : MaterialButton(
                                          onPressed: () {
                                            (onBoardingControlller
                                                        .getCurrentIndex !=
                                                    2)
                                                ? carouselController.nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.linear)
                                                : null;
                                          },
                                          child: Row(
                                            children: const [
                                              Text("Next"),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Text(
                                                  "→",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  onePage(BuildContext context, SearshController appState) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FlightAirport(),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => pickDate(context, appState),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(text: "Depart"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.date_range),
                        Obx(
                          () => textWidget(
                              text:
                                  "${appState.start!.value.year}/${appState.start!.value.month}/${appState.start!.value.day}"),
                        ),
                      ],
                    ),
                    line(
                      height: 1.0,
                      width: 70.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              textWidget(text: "Shopping items", size: 20),
              for (var i = 0; i < 2; i++)
                Card(
                  color: Colors.amber,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: const Color(0xFF64B5F6)),
                    ),
                    height: 80,
                    child: const Icon(
                      Icons.camera_alt,
                      color: Color(0xFF64B5F6),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: FlyingButtonSearch(
                  titel: "Add a new shipment",
                  onTap: () {
                    Get.to(() => const ProductView());
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: FlyingButtonSearch(
                  titel: "Choose from Wish List",
                  onTap: () {
                    Get.to(() => const FavoriteView());
                  },
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }

  twoPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              // ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Center(child: Text("عنوان الشحنة")),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "SFO",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    ),
                    Center(
                        child: Transform.rotate(
                      angle: 1.5,
                      child: Icon(
                        Icons.local_airport,
                        color: Colors.indigo.shade300,
                        size: 24,
                      ),
                    )),
                    const Text(
                      "SFO",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text("data"),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Total orders"),
                    Text(
                      "9",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Total weight"),
                    Text(
                      "9",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("رسوم الشحن"),
                    Text(
                      "\$ 350",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                      "1 May 2022",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
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
          // const SizedBox(height: 20),
          Image.asset(
            "assets/images/barcode.jpg",
          ),
        ],
      ),
    );
  }

  threePage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          TextFormField(
            maxLines: 2,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              labelText: "Note",
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
            children: [
              Checkbox(
                value: valueChek,
                onChanged: (newValue) => setState(
                  () {
                    valueChek = newValue!;
                  },
                ),
              ),
              const Expanded(
                child: Text(
                    "I acknowledge that all the details of this shipment are correct, and if any details are incorrect, unclear or missing, this will lead to the complete cancellation of the insurance applied to the shipment."),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
              child: const Text("Order Policy"),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
              child: const Text("common questions"),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
