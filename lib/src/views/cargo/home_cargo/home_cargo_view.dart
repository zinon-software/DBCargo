import 'package:carousel_slider/carousel_slider.dart';
import 'package:dpcargo/src/views/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FlightAirport(),
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

          // const SizedBox(
          //   height: 10,
          // ),
          textWidget(text: "Shopping items", size: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: FlyingButtonSearch(
              titel: "Add a new shipment",
              onTap: () {
                Get.to(() => const ProductView());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: FlyingButtonSearch(
              titel: "Choose from Wish List",
              onTap: () {
                Get.to(() => const FavoriteView());
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  twoPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("عنوان الشحنة"),
              Row(
                children: [
                  const Text(
                    "SFO",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                  const SizedBox(width: 16),
                  Center(
                      child: Transform.rotate(
                    angle: 1.5,
                    child: Icon(
                      Icons.local_airport,
                      color: Colors.indigo.shade300,
                      size: 24,
                    ),
                  )),
                  const SizedBox(width: 16),
                  const Text(
                    "SFO",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          const Text("data"),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Total orders"),
              Text("9"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Total weight"),
              Text("9"),
            ],
          ),
          SizedBox(height: 20),
          Image.asset(
            "assets/images/barcode.jpg",
          ),
          // MediaQuery.removePadding(
  //   context: context,
  //   removeTop: true,
  //   child: GridView.builder(
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 3,
  //     ),
  //     itemCount: 5,
  //     itemBuilder: (BuildContext context, int index) {
  //       return Card(
  //         color: Colors.amber,
  //         child: Center(child: Text('$index')),
  //       );
  //     }
  //   ),
  // )
        ],
      ),
    );
  }

  threePage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FlightAirport(),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                labelText: "cargo name",
                hintText: "Enter your text here"),
          ),
          TextField(
            minLines: 2,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                labelText: 'Description',
                hintText: '描述下发生的'),
          ),
          FlyingButtonSearch(
            titel: "Favorite",
            onTap: () {
              Get.to(() => const FavoriteView());
            },
          ),
          FlyingButtonSearch(
            titel: "add product",
            onTap: () {
              Get.to(() => const ProductView());
            },
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
