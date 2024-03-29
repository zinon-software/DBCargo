import 'package:dpcargo/src/views/utilities/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../cargo/home_cargo/home_cargo_view.dart';
import '../trips/home_trips/home_trips_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Responsive(
          mobile: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              WidgetBanner(),
              WidgetTitle(),
              WidgetStraggeredGridView(
                crossAxisCount: 2,
              ),
            ],
          ),
          tab: tabAndDesktopBannerWidget(3, context),
          desktop: tabAndDesktopBannerWidget(6, context),
        ),
      ),
    );
  }

  Column tabAndDesktopBannerWidget(int size, BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: const Color(0xFF64B5F6),
          child: const WidgetBanner(),
        ),
        Row(
          children: [
            const WidgetTitle(),
            Expanded(
                child: WidgetStraggeredGridView(
              crossAxisCount: size,
            )),
          ],
        ),
        if (isDesktop(context))
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            color: const Color(0xFF64B5F6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "DBCargo.com",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.whatsapp),
                    Icon(Icons.facebook),
                    Icon(Icons.snapchat),
                    Icon(Icons.telegram),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.snapchat),
                    // Icon(Icons.snapchat),
                    Row(
                      children: const [
                        Icon(Icons.paypal),
                        Icon(Icons.payment),
                        Icon(Icons.paypal),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
      ],
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
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          // height: 380,
          height: size.height * 0.7,
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            color: Color(0xFF64B5F6),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Image.asset('assets/images/homePage/banners.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
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
                    ),
                  ),
                  SizedBox(
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
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
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
                      ),
                    ),
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WidgetStraggeredGridView extends StatefulWidget {
  const WidgetStraggeredGridView({Key? key, required this.crossAxisCount})
      : super(key: key);
  final int crossAxisCount;

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
        // crossAxisCount: isMobile(context) ? 2 : 4,
        crossAxisCount: widget.crossAxisCount,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          CustomCard(
            onTap: () {
              Get.to(() => const HomeTripsView());
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
                      child: Icon(Icons.airplane_ticket),
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
              Get.to(() => const HomeCargoView());
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
                      child: Icon(Icons.card_giftcard_outlined),
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
                      child: Icon(Icons.calculate),
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
                    child: const Center(child: Icon(Icons.car_rental))),
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
                    child: const Center(child: Icon(Icons.analytics))),
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
                    child: const Center(child: Icon(Icons.restore))),
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
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
              borderRadius ?? BorderRadius.circular(25),
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
            child: child ?? Container(),
          ),
        ),
      ),
    );
  }
}
