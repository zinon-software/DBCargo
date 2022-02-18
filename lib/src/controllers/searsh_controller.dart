import 'dart:developer';

import 'package:dpcargo/src/models/airport_model.dart';
import 'package:get/get.dart';

import '../models/category.dart';

class SearshController extends GetxController {
  RxInt _travellers = 0.obs;

  RxInt _adult = 0.obs;
  RxInt _child = 0.obs;
  RxInt _infant = 0.obs;

  get getTravellers => _travellers.value;

  get getAdult => _adult.value;

  get getChild => _child.value;

  get getInfant => _infant.value;

  void addAdult() {
    _adult.value += 1;
    _travellers.value += 1;
    log(_adult.value.toString());
  }

  void addChild() {
    _child.value += 1;
    _travellers.value += 1;
  }

  void addInfant() {
    _infant.value += 1;
    _travellers.value += 1;
  }

  void removeAdult() {
    _adult.value -= 1;
    _travellers.value -= 1;
  }

  void removeChild() {
    _child.value -= 1;
    _travellers.value -= 1;
  }

  void removeInfant() {
    _infant.value -= 1;
    _travellers.value -= 1;
  }

  // Airport
  Rx<AirportModel> _arrivalAirport =
      AirportModel(name: "BAS", city: "Mumbai").obs;
  Rx<AirportModel> _departureAirport =
      AirportModel(name: "SFO", city: "SunFransisco").obs;

  get getArrivalAirport => _arrivalAirport;
  get getDepartureAirport => _departureAirport;

  void setArrivalAirport(query) {
    _arrivalAirport = query;
  }

  void setDepartureAirport(query) {
    _departureAirport = query;
  }

  // Catgory
  Rx<Category> selectedCategory = Category(
    categoryId: 0,
    name: 'ONE WAY',
  ).obs;

  void updateCategory(Category selectedCatgory) {
    selectedCategory.value = selectedCatgory;
  }

  RxList categories = [
    Category(
      categoryId: 0,
      name: 'ONE WAY',
    ),
    Category(
      categoryId: 2,
      name: 'ROUND TRIP',
    ),
    Category(
      categoryId: 1,
      name: 'MULTI-CITY',
    ),
  ].obs;

  // flying date

  Rx<DateTime>? start = DateTime(2022, 2, 11).obs,
      end = DateTime(2022, 2, 28).obs;
}
