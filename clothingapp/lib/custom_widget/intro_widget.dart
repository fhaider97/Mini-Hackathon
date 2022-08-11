import 'dart:ui';
import 'package:clothingapp/custom_widget/textt.dart';
import 'package:clothingapp/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShopNowWid extends StatelessWidget {
  ShopNowWid(
      {Key? key,
      required this.img,
      required this.text1,
      required this.text2,
      required this.pageController,
      required this.text3,
      required this.text4})
      : super(key: key);
  final String img;
  final String text1, text2, text3, text4;
  PageController pageController;

//   @override
//   State<ShopNow> createState() => _ShopNowState();
// }

// class _ShopNowState extends State<ShopNow> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("$img",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/Vector.png",
                          scale: 4,
                        ),
                        SizedBox(
                          height: 250.h,
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "NO",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '$text1',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 45)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Featured",
                                style: TextStyle(
                                    color: Color.fromRGBO(254, 37, 80, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Tailored",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 45),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "$text2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: "$text3",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20))
                                ])),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "$text4",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LogInScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                side: BorderSide(color: Colors.white),
                                fixedSize: Size(290, 45),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "Shop Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                        SizedBox(height: 16),
                        Container(
                            // color: Colors.red,
                            height: 40.h,
                            child: Center(
                                child: SmoothPageIndicator(
                              controller: pageController,
                              count: 3,
                              effect: const WormEffect(
                                  dotWidth: 10.0,
                                  dotHeight: 10.0,
                                  spacing: 10,
                                  paintStyle: PaintingStyle.stroke,
                                  activeDotColor:
                                      Color.fromRGBO(254, 37, 80, 1)),
                            ))),
                      ],
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
