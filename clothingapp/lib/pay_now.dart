import 'package:clothingapp/bottom_nav_controller.dart';
import 'package:clothingapp/custom_widget/pink_buttons.dart';
import 'package:clothingapp/tab_bar/women.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayNow extends StatelessWidget {
  const PayNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/success.png"),
            SizedBox(
              height: 25.h,
            ),
            const Text(
              "Payment Sucessful",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text(
              "Your order will be ready in 5 days,",
              style: TextStyle(fontSize: 17),
            ),
            const Text("including shipping, more details and",
                style: TextStyle(fontSize: 17)),
            const Text("options for tracking will be sent to your",
                style: TextStyle(fontSize: 17)),
            const Text("your email", style: TextStyle(fontSize: 17)),
            const Text("\n Thanks!! \n ", style: TextStyle(fontSize: 18)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xffFE2550),
                  fixedSize: Size(234.w, 58.h),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BottomComtroller()));
                },
                child: const Text("Continue Shopping"))
          ],
        ),
      )),
    );
  }
}
