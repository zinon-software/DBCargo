import 'package:carousel_slider/carousel_slider.dart';
import 'package:dpcargo/src/views/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
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

class HomeCargoView extends StatelessWidget {
  const HomeCargoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearshController appState = Get.find();

    CarouselController carouselController = CarouselController();
    final OnBoardingControlller onBoardingControlller =
        Get.put(OnBoardingControlller());

    Widget onboardingItem(int item) {
      if (item == 1) {
        return onePage(context, appState);
      } else if (item == 2) {
        return towPage();
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
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Obx(
                    () => Center(
                      child: Stack(
                        children: [
                          CarouselSlider(
                            items: onBoardingControlller.dataWidget
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
                              child: Container(
                                color: const Color.fromARGB(255, 221, 56, 15),
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
                                                      .previousPage()
                                                  : null;
                                            },
                                            child: const Text(
                                              "< Bake",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                    onBoardingControlller.getCurrentIndex == 2
                                        ? MaterialButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "Finish",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))
                                        : MaterialButton(
                                            onPressed: () {
                                              (onBoardingControlller
                                                          .getCurrentIndex !=
                                                      2)
                                                  ? carouselController
                                                      .nextPage()
                                                  : null;
                                            },
                                            child: const Text(
                                              "Next >",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                  ],
                                ),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
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

  towPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              Get.to(() => const FlightTickets());
            },
          ),
          FlyingButtonSearch(
            titel: "add product",
            onTap: () {
              Get.to(() => const FlightTickets());
            },
          ),
          const SizedBox(
            height: 5,
          ),
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
