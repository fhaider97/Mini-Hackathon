import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Colorsss extends StatelessWidget {
  const Colorsss({Key? key, required this.color1}) : super(key: key);
  final Color color1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 35.w,
      decoration: BoxDecoration(
        color: color1,
        shape: BoxShape.circle,
      ),
    );
  }
}
