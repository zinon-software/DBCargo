import 'package:dpcargo/src/models/airport_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../models/category.dart';

class SearshController extends GetxController {

  //Passinger
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
      AirportModel(name: "NYC", city: "NewYork").obs;

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
      name: 'One-Way',
    ),
    Category(
      categoryId: 2,
      name: 'Round Trip',
    ),
    Category(
      categoryId: 1,
      name: 'Multi-City',
    ),
  ].obs;

  // flying date

  Rx<DateTime>? start = DateTime.now().obs, end = DateTime.now().obs;

  // cabina class

  Rx<CabinaClassModel> selectedCabinaClass = CabinaClassModel(
    ID: 0,
    name: 'Economy',
    icon: Icons.chair_alt,
  ).obs;

  void updateCabinaClass(CabinaClassModel selected) {
    selectedCabinaClass.value = selected;
  }

  RxList cabinaClass = [
    CabinaClassModel(
      ID: 0,
      name: 'Economy',
      icon: Icons.chair_alt,
    ),
    CabinaClassModel(
      ID: 1,
      name: 'Business',
      icon: FontAwesomeIcons.chair,
    ),
    CabinaClassModel(
      ID: 2,
      name: 'First',
      icon: Icons.chair,
    ),
  ].obs;
}

class CabinaClassModel {
  String name;
  IconData icon;
  int ID;
  CabinaClassModel({required this.ID, required this.name, required this.icon});
}