import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class XMargin extends StatelessWidget {
  const XMargin(this.x, {super.key});

  final double x;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: (x.sp));
  }
}

class YMargin extends StatelessWidget {
  const YMargin(this.y, {super.key});

  final double y;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: (y.sp));
  }
}

double screenHeight(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.height * percent;

double screenWidth(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.width * percent;
