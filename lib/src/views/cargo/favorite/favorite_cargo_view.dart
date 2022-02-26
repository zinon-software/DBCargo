import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const WidgetBanner(),
            const WidgetTitle(),
            const WidgetStraggeredGridView(),
          ],
        ),
      ),
    );
  }
}

class WidgetBanner extends StatefulWidget {
  const WidgetBanner({Key? key}) : super(key: key);

  @override
  _WidgetBannerState createState() => _WidgetBannerState();
}

class _WidgetBannerState extends State<WidgetBanner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 380,
          decoration: const BoxDecoration(
            color: Color(0xFF64B5F6),
            image: DecorationImage(
              image: AssetImage('assets/images/homePage/banners.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: MyColors.blackText,
                        )),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(
                            color: MyColors.blackText,
                            fontSize: MyFontSize.small2),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle_outlined,
                            size: 10,
                            color: MyColors.blackText,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Khartoum",
                            style: TextStyle(
                                color: MyColors.blackText,
                                fontSize: MyFontSize.medium1),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 24,
                            color: MyColors.blackText,
                          ),
                        ],
                      ),
                    ],
                  )),
                  Container(
                    width: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset(
                        "assets/images/homePage/avatar.jpg",
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Tracking Your Package",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: MyColors.blackText,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Text(
                "Please enter your tracking number",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MyColors.blackText,
                  fontSize: MyFontSize.medium1,
                ),
              ),
              const SizedBox(height: 20),
              CustomCard(
                shadow: false,
                height: 45,
                width: double.infinity,
                bgColor: MyColors.white,
                borderRadius: BorderRadius.circular(10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.car_rental,
                      color: MyColors.yellow,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      "Enter track number",
                      style: MyStyle.textParagraphBlack,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomCard(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingShipment()));
                        },
                        shadow: false,
                        bgColor: MyColors.yellow,
                        borderRadius: BorderRadius.circular(10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 7),
                        child: Text(
                          "Track",
                          style: MyStyle.textParagraphBlack,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class WidgetStraggeredGridView extends StatefulWidget {
  const WidgetStraggeredGridView({Key? key}) : super(key: key);

  @override
  _WidgetStraggeredGridViewState createState() =>
      _WidgetStraggeredGridViewState();
}

class _WidgetStraggeredGridViewState extends State<WidgetStraggeredGridView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          CustomCard(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingShipment()));
            },
            shadow: false,
            width: double.infinity,
            bgColor: MyColors.green,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    bgColor: MyColors.yellow,
                    borderRadius: BorderRadius.circular(100),
                    child: const Center(
                      child: const Icon(Icons.airplane_ticket),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Airline ticket booking",
                  style: TextStyle(
                      color: MyColors.white,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Book the cheapest flight deals",
                  style: TextStyle(
                    color: MyColors.white.withOpacity(.8),
                    fontSize: MyFontSize.small3,
                  ),
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingShipment()));
            },
            shadow: false,
            width: double.infinity,
            bgColor: MyColors.green,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    bgColor: MyColors.yellow,
                    borderRadius: BorderRadius.circular(100),
                    child: const Center(
                      child: const Icon(Icons.calculate),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Ship your luggage all over the world",
                  style: TextStyle(
                      color: MyColors.white,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "We offer you the cheapest shipping offers in the world",
                  style: TextStyle(
                    color: MyColors.white.withOpacity(.8),
                    fontSize: MyFontSize.small3,
                  ),
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingShipment()));
            },
            shadow: false,
            width: double.infinity,
            bgColor: MyColors.green,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    bgColor: MyColors.yellow,
                    borderRadius: BorderRadius.circular(100),
                    child: const Center(
                      child: const Icon(Icons.calculate),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Calculate shipment amount",
                  style: TextStyle(
                      color: MyColors.white,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "All price options are base on price",
                  style: TextStyle(
                    color: MyColors.white.withOpacity(.8),
                    fontSize: MyFontSize.small3,
                  ),
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingShipment()));
            },
            shadow: false,
            width: double.infinity,
            bgColor: MyColors.softGrey,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    bgColor: MyColors.yellow,
                    borderRadius: BorderRadius.circular(100),
                    child: const Center(child: const Icon(Icons.car_rental))),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Track Your Shipment Location",
                  style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Control your package like a boss, you will know every movement of the package and the estimation",
                  style: TextStyle(
                    color: MyColors.blackText.withOpacity(.8),
                    fontSize: MyFontSize.small3,
                  ),
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingShipment()));
            },
            shadow: false,
            width: double.infinity,
            bgColor: MyColors.softGrey,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    bgColor: MyColors.yellow,
                    borderRadius: BorderRadius.circular(100),
                    child: const Center(child: const Icon(Icons.analytics))),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Your order history",
                  style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "View all your order history. See how we sent it so fast. We believe that the sooner we ship to you, the better our service will be in your eyes.",
                  style: TextStyle(
                    color: MyColors.blackText.withOpacity(.8),
                    fontSize: MyFontSize.small3,
                  ),
                ),
              ],
            ),
          ),
          CustomCard(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingShipment()));
            },
            shadow: false,
            width: double.infinity,
            bgColor: MyColors.softGrey,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                    shadow: false,
                    height: 50,
                    width: 50,
                    bgColor: MyColors.yellow,
                    borderRadius: BorderRadius.circular(100),
                    child: const Center(child: const Icon(Icons.restore))),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Return the damaged item",
                  style: TextStyle(
                      color: MyColors.blackText,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "We accept returns of damaged goods due to our less than optimal delivery, or external intervention that causes your goods to be damaged. We know that customer satisfaction is our satisfaction",
                  style: TextStyle(
                    color: MyColors.blackText.withOpacity(.8),
                    fontSize: MyFontSize.small3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetTitle extends StatefulWidget {
  const WidgetTitle({Key? key}) : super(key: key);

  @override
  _WidgetTitleState createState() => _WidgetTitleState();
}

class _WidgetTitleState extends State<WidgetTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Column(
        children: [
          Text("What are you looking for?",
              textAlign: TextAlign.center, style: MyStyle.textTitleBlack),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Here are our best features",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: MyFontSize.medium1,
            ),
          ),
        ],
      ),
    );
  }
}

class MyColors {
  static Color blackText = const Color(0xFF302B38);
  static Color green = const Color(0xFF1B936E);
  static Color yellow = const Color(0xFFF2BA30);
  static Color softGrey = const Color(0xFFE9E9E9);
  static Color white = const Color(0xFFFFFFFF);
}

class MyFontSize {
  static double small1 = 8;
  static double small2 = 10;
  static double small3 = 12;
  static double medium1 = 14;
  static double medium2 = 16;
  static double large1 = 18;
  static double large2 = 20;
  static double large3 = 22;
}

class MyStyle {
  static TextStyle textTitleBlack = TextStyle(
      color: MyColors.blackText,
      fontSize: MyFontSize.large2,
      fontWeight: FontWeight.bold);

  static TextStyle textParagraphBlack = TextStyle(
    color: MyColors.blackText,
    fontSize: MyFontSize.medium2,
  );
}

class CustomCard extends StatelessWidget {
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry padding;
  final double? height;
  final double? width;
  final Color bgColor;
  final BorderRadius? borderRadius;
  final bool shadow;
  final Color shadowColor;
  final double shadowOpacity;
  final double elevationX;
  final double elevationY;
  final double shadowBlur;
  final Widget? child;

  const CustomCard({
    Key? key,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.height,
    this.width,
    this.bgColor = Colors.transparent,
    this.borderRadius,
    required this.shadow,
    this.shadowColor = Colors.grey,
    this.shadowOpacity = 1,
    this.elevationX = 0,
    this.elevationY = 1,
    this.shadowBlur = 6,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius:
              borderRadius == null ? BorderRadius.circular(25) : borderRadius,
          boxShadow: [
            if (shadow)
              BoxShadow(
                color: shadowColor.withOpacity(shadowOpacity),
                offset: Offset(elevationX, elevationY),
                blurRadius: shadowBlur,
              ),
          ]),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              borderRadius == null ? BorderRadius.circular(25) : borderRadius!,
        ),
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Colors.transparent,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: child == null ? Container() : child,
          ),
        ),
      ),
    );
  }
}
