import 'package:fast_foodie/shared/config/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final double width;
  final double height;
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
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 280,
    this.height = 45,
    this.fontSize = 17,
    this.borderRadius = 4,
    this.fontColor = Colors.white,
    this.filled = true,
    this.verticalGradient = true,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: filled ? null : Border.all(color: AppThemes.secondaryLight, width: 2.w),
        borderRadius: BorderRadius.circular(borderRadius.w),
        gradient: color == null && filled
            ? LinearGradient(
                begin: verticalGradient ? Alignment.topCenter : Alignment.centerLeft,
                end: verticalGradient ? Alignment.bottomCenter : Alignment.centerRight,
                colors: AppThemes.secondaryGradient,
              )
            : null,
        color: filled ? color : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius.w),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius.w),
          splashColor: Colors.greenAccent,
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: icon == null ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                if (icon != null)
                  Padding(
                    padding: EdgeInsets.only(left: 6.w, right: 4.w),
                    child: icon,
                  ),
                Text(
                  label,
                  style: TextStyle(
                      fontSize: fontSize.sp, color: filled ? fontColor : color, fontFamily: AppThemes.fontFamily, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
