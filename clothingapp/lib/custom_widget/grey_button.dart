import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GreyButton extends StatelessWidget {
  const GreyButton({Key? key, required this.text1}) : super(key: key);
  final String text1;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.black,
            primary: Color(0xffE5E5E5),
            fixedSize: Size(100, 36),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text((text1)));
  }
}
