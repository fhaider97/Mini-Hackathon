import 'dart:ffi';

import 'package:clothingapp/custom_widget/color_cont.dart';
import 'package:clothingapp/custom_widget/grey_button.dart';
import 'package:clothingapp/custom_widget/pink_buttons.dart';
import 'package:clothingapp/specify_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Measurements extends StatefulWidget {
  Measurements({Key? key}) : super(key: key);

  @override
  State<Measurements> createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> {
  String dropdownValue = '1';
  var items1 = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                "WAIST",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              Text("LENGTH",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              Text("BREADTH",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GreyButton(text1: "32"),
              GreyButton(text1: "43"),
              GreyButton(text1: "70")
            ],
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Color:",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              Colorsss(color1: Colors.black),
              Colorsss(color1: Color(0xffEFE8D8)),
              Colorsss(color1: Color(0xff43163A)),
              DropdownButton(
                  value: dropdownValue,
                  // dropdownColor: Colors.green,
                  focusColor: Colors.black,
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconEnabledColor: Colors.red,
                  items: items1.map((String items2) {
                    return DropdownMenuItem(
                      value: items2,
                      child: Text(items2),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      print(dropdownValue);
                    });
                  })
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23.0),
            child: Text(
              "Do you want to use this material",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                PinkButton(height1: 40.h, txt: "Yes", width1: 70.w),
                SizedBox(
                  width: 15.w,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, onPrimary: Colors.black),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SpecifyMaterial()));
                    },
                    child: Text("No"))
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text("Total"),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "\$25.99",
                  style: TextStyle(
                      color: Color(0xffFE2550), fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 20.w,
                ),
                PinkButton(height1: 52.h, txt: "Add to Bag", width1: 200.w)
              ],
            ),
          )
        ],
      ),
    );
  }
}
