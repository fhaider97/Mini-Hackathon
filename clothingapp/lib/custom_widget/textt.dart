import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Text1 extends StatelessWidget {
  const Text1({Key? key, required this.textt}) : super(key: key);
  final String textt;

  @override
  Widget build(BuildContext context) {
    return Text(
      textt,
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
    );
  }
}

class Sized extends StatelessWidget {
  const Sized({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
    );
  }
}
