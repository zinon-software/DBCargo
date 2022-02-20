import 'package:carousel_slider/carousel_slider.dart';
import 'package:dpcargo/src/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/onboarding_controller.dart';
import '../../models/onboarding_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    final OnBoardingControlller onBoardingControlller =
        Get.put(OnBoardingControlller());

    onboardingItem(OnBoardingModel item) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item.imageUrl),
          const SizedBox(
            height: 48,
          ),
          Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: kTitleColor,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            item.subtitle,
            style: TextStyle(
              fontSize: 16,
              color: kSubtitleColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: onBoardingControlller.getCurrentIndex == 0 ? kTitleColor : kSubtitleColor,
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
                  color: onBoardingControlller.getCurrentIndex == 1 ? kTitleColor : kSubtitleColor,
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
                  color: onBoardingControlller.getCurrentIndex == 2 ? kTitleColor : kSubtitleColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          MaterialButton(
            onPressed: () {
              (onBoardingControlller.getCurrentIndex != 2) ? carouselController.nextPage() : Get.offAll(() => const HomeView());
            },
            color: kTitleColor,
            minWidth: 180,
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              onBoardingControlller.getCurrentIndex == 2 ? 'Get Started' : 'Next',
              style: TextStyle(
                fontSize: 16,
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    }

    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  CarouselSlider(
                    items: onBoardingControlller.data
                        .map((item) =>
                            onboardingItem(OnBoardingModel.fromJson(item)))
                        .toList(),
                    options: CarouselOptions(
                      initialPage: onBoardingControlller.getCurrentIndex,
                      height: double.infinity,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        onBoardingControlller.setCurrentIndex(index);
                      },
                    ),
                    carouselController: carouselController,
                  ),
                  onBoardingControlller.getCurrentIndex == 2
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              carouselController.animateToPage(2);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 28),
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: kSubtitleColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

var kTitleColor = const Color(0xff6974DE);
var kSubtitleColor = const Color(0xff040078).withOpacity(0.32);
var kWhiteColor = Colors.white;
