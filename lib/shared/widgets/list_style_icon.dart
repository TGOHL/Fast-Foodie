import 'package:fast_foodie/shared/config/themes.dart';
import 'package:fast_foodie/shared/enums/list_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListStyleIcon extends StatelessWidget {
  final ListStyle listStyle;
  final bool isSelected;
  final VoidCallback onTap;
  const ListStyleIcon({super.key, required this.listStyle, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppThemes.secondaryDark : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(4.w),
        ),
        margin: EdgeInsets.all(4.w),
        padding: EdgeInsets.all(4.w),
        child: Icon(
          listStyle == ListStyle.mini ? Icons.view_list : Icons.line_weight_sharp,
          color: isSelected ? Colors.white : null,
        ),
      ),
    );
  }
}
