import 'package:fast_foodie/shared/config/styles.dart';
import 'package:fast_foodie/shared/enums/direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlantPieceOfInfo extends StatelessWidget {
  final String title;
  final double titleMaxWidth;
  final dynamic value;
  final TextOverflow overflow;
  final Direction direction;
  const PlantPieceOfInfo({
    super.key,
    required this.title,
    this.value,
    this.titleMaxWidth = 58,
    this.overflow = TextOverflow.ellipsis,
    this.direction = Direction.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    if (direction == Direction.vertical) {
      return Container(
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppStyles.mainTextStyle,
            ),
            Text(
              value?.toString() ?? 'N/A',
              overflow: overflow,
              textAlign: TextAlign.center,
              style: AppStyles.mainTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ],
        ),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: titleMaxWidth.w,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: AppStyles.mainTextStyle,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value?.toString() ?? 'N/A',
            overflow: overflow,
            style: AppStyles.mainTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
