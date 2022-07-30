import 'package:clothingapp/custom_widget/color_cont.dart';
import 'package:clothingapp/custom_widget/pink_buttons.dart';
import 'package:clothingapp/custom_widget/textt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecifyMaterial extends StatefulWidget {
  const SpecifyMaterial({Key? key}) : super(key: key);

  @override
  State<SpecifyMaterial> createState() => _SpecifyMaterialState();
}

class _SpecifyMaterialState extends State<SpecifyMaterial> {
  TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            "Specify Materials",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 27,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "Material",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Sized(),
                Text1(textt: "Lace"),
                Sized(),
                Text1(textt: "Ankara"),
                Sized(),
                Text1(textt: "Guinea"),
                Sized(),
                Text1(textt: "Linen"),
                Sized(),
                Text1(textt: "Silk"),
                Sized(),
                Text1(textt: "Wool"),
                Sized(),
                Text1(textt: "Cotton"),
                SizedBox(
                  height: 40.h,
                ),
                Text("ENTER THE COLOR",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Sized(),
                Row(
                  children: [
                    Colorsss(color1: Colors.black),
                    Colorsss(
                      color1: Color(0xffEFE8D8),
                    ),
                    Colorsss(color1: Color(0xff43163A)),
                    Colorsss(color1: Color(0xff00AEFF)),
                    Colorsss(color1: Color(0xffFC8233))
                  ],
                ),
                Sized(),
                Text("HOW MANY YARDS?",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Sized(),
                Container(
                  height: 48.h,
                  width: 240.w,
                  child: TextField(
                    controller: controller1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF8F8F8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffF8F8F8),
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffF8F8F8))),
                        filled: true,
                        fillColor: Color(0xffF8F8F8)),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                PinkButton(height1: 60.h, txt: "Done", width1: 300.w)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
