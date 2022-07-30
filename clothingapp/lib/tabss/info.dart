import 'package:clothingapp/custom_widget/pink_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Info extends StatefulWidget {
  var products1;
  Info({Key? key, this.products1}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            const Text(
              "MATERIALS",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(widget.products1["product-description"]),
            SizedBox(
              height: 30.h,
            ),
            const Text(
              "WASH INSTRUCTION",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(widget.products1["product-description"]),
          ],
        ),
      ),
    );
  }
}
