import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cargo/home_cargo/home_cargo_view.dart';
import '../trips/home_trips/home_trips_view.dart';

import 'components/slideshow.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xfff00d5d8),
      backgroundColor: Color(0xFF64B5F6),
      body: Container(
        // height: MediaQuery.of(context).size.height - 100,
        padding: const EdgeInsets.only(bottom: 10.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrond_image.png'),
            fit: BoxFit.fill,
          ),
          // color: Colors.grey[300],
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 5,
              // child: Image.asset('assets/images/logos.png'),
              child: SizedBox(),
            ),
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 29),
                child: Center(
                  child: Text(
                    "DP CARGO SAVE WHILE TRAVELLING",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
            ComplicatedImageDemo(),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 80.0,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Get.to(() => const HomeTripsView());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        //  color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12.0),
                        // border: Border.all(
                        //   color: Colors.white.withOpacity(1.0),
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600,
                            offset: const Offset(4, 4),
                            blurRadius: 15.0,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_airport,
                            color: Colors.indigo.shade300,
                            size: 24,
                          ),
                          const Text(
                            'Trips',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const HomeCargoView());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.0),
                        // border: Border.all(
                        //   color: Colors.white.withOpacity(1.0),
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600,
                            offset: const Offset(4, 4),
                            blurRadius: 15.0,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.card_giftcard_outlined,
                            color: Colors.indigo.shade300,
                            size: 24,
                          ),
                          const Text(
                            'Cargo',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
