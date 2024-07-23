import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fast_foodie/shared/config/themes.dart';

class AppStyles {
  static const TextStyle toastTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.white,
  );
  static TextStyle mainTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
    color: AppThemes.fontMain,
    fontFamily: AppThemes.fontFamily,
  );
}
