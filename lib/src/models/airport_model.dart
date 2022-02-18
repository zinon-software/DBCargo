class AirportModel {
  String name;
  String city;

  AirportModel({required this.name, required this.city});
}

List<AirportModel> listAirports = [
  AirportModel(name: "BAS", city: "Mumbai"),
  AirportModel(name: "BGT", city: "NewYork"),
  AirportModel(name: "BSH", city: "SunFransisco"),
  AirportModel(name: "NYC", city: "NewYork"),
  AirportModel(name: "SFO", city: "SunFransisco"),
  AirportModel(name: "JFK", city: "NewYork"),
];
