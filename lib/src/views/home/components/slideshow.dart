

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideShowModel {
  final String? image;
  final String? titel;

  SlideShowModel({this.image, this.titel});
}

final List<SlideShowModel> imgList = [
  SlideShowModel(
    image: 'assets/images/image1.jpg',
    titel: "Cargo",
  ),
  SlideShowModel(
    image: 'assets/images/image2.jpg',
    titel: "Delivery",
  ),
  SlideShowModel(
    image: 'assets/images/image3.jpg',
    titel: "Ticket booking",
  ),
];


class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset("${item.image}",
                        fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${(imgList.indexOf(item) + 1)} ${item.titel}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
