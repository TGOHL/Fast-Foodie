import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/themes.dart';

class MainButton extends StatelessWidget {
  final int width;
  final int height;
  final String label;
  final int fontSize;
  final int borderRadius;
  final Function() onPressed;
  final Color fontColor;
  final bool filled;
  final bool verticalGradient;
  final Widget? icon;
  final Color? color;

  const MainButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width = 280,
    this.height = 45,
    this.fontSize = 19,
    this.borderRadius = 4,
    this.fontColor = Colors.white,
    this.filled = true,
    this.verticalGradient = true,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // border: filled
        //     ? null
        //     : Border.all(color: AppThemes.secondaryLight, width: 2.w),
        borderRadius: BorderRadius.circular(borderRadius.w),
        boxShadow: filled
            ? [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 6.w,
                  offset: Offset(-3.w, 3.w),
                ),
              ]
            : [],
        gradient: color == null && filled
            ? LinearGradient(
                begin: verticalGradient
                    ? Alignment.topCenter
                    : Alignment.centerLeft,
                end: verticalGradient
                    ? Alignment.bottomCenter
                    : Alignment.centerRight,
                colors: AppThemes.secondaryGradient,
              )
            : null,
        color: color,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius.w),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius.w),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: icon == null
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                if (icon != null)
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, right: 4.w),
                    child: icon,
                  ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize.sp,
                    color: fontColor,
                    // fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
