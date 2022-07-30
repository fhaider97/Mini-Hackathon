import 'package:clothingapp/custom_widget/intro_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShopNow extends StatefulWidget {
  @override
  State<ShopNow> createState() => _ShopNowState();
}

class _ShopNowState extends State<ShopNow> {
  PageController Controllerr = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: Controllerr,
        children: const [
          ShopNowWid(
              img: "assets/images/images1.png",
              text1: "1",
              text2: "Jennifer Kingsley",
              text3: " exploring the",
              text4: "new range of winter fashion wear"),
          ShopNowWid(
              img: "assets/images/image02.png",
              text1: "2",
              text2: "Jimmy Chuka",
              text3: " exploring new",
              text4: "spring sweater collection"),
          ShopNowWid(
              img: "assets/images/image03.png",
              text1: "3",
              text2: "Christain Lobi ",
              text3: "showing us his new",
              text4: "summer beach wears")
        ],
      ),
      bottomSheet: Container(
          height: 40.h,
          child: Center(
              child: SmoothPageIndicator(
            controller: Controllerr,
            count: 3,
            effect: const WormEffect(
                dotWidth: 10.0,
                dotHeight: 10.0,
                spacing: 10,
                paintStyle: PaintingStyle.stroke,
                activeDotColor: Color.fromRGBO(254, 37, 80, 1)),
          ))),
    );
  }
}
