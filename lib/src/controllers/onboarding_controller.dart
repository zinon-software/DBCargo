import 'package:get/get.dart';

class OnBoardingControlller extends GetxController {
    RxInt _currentIndex = 0.obs;

    get getCurrentIndex => _currentIndex.value;

  void setCurrentIndex(int index) {
    _currentIndex.value = index;
  }
 

  RxList data = [
    {
      'title': 'Destination',
      'subtitle':
          'There are many variations of passages \nof Lorem Ipsum available, but the \nmajority have suffered alteration in \nsome form',
      'imageUrl': 'assets/images/onBoarding/image1.png',
    },
    {
      'title': 'Ticket Booking',
      'subtitle':
          'Contrary to popular belief, Lorem Ipsum \nis not simply random text. It has roots \nin a piece of classical Latin literature from \n45 BC, making it over 2000 years old.',
      'imageUrl': 'assets/images/onBoarding/image2.png',
    },
    {
      'title': 'Enjoy Your Holiday',
      'subtitle':
          'There are many variations of passages \nof Lorem Ipsum available, but the \nmajority have suffered alteration in \nsome form',
      'imageUrl': 'assets/images/onBoarding/image3.png',
    },
  ].obs;
}
