import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PinkButton extends StatelessWidget {
  const PinkButton(
      {Key? key,
      required this.height1,
      required this.txt,
      required this.width1})
      : super(key: key);

  final double height1;
  final double width1;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width1, height1),
          onPrimary: Colors.white,
          primary: Color(0xffFE2550),
        ),
        onPressed: () {},
        child: Text(txt));
  }
}
