import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Line extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  const Line({
    super.key,
    this.height = 1,
    this.width = 130,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      color: color ?? Colors.grey[600],
    );
  }
}
