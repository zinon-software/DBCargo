class OnBoardingModel {
  String imageUrl;
  String title;
  String subtitle;

  OnBoardingModel({required this.imageUrl, required this.subtitle, required this.title});

 
  factory OnBoardingModel.fromJson(Map<String, dynamic> json) => OnBoardingModel(
        title: json["title"],
        subtitle: json["subtitle"],
        imageUrl: json["imageUrl"],
    );
}