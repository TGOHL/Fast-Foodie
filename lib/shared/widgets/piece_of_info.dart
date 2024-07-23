import 'package:fast_foodie/shared/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlantPieceOfInfo extends StatelessWidget {
  final String title;
  final double titleMaxWidth;
  final dynamic value;
  const PlantPieceOfInfo({super.key, required this.title, this.value, this.titleMaxWidth = 58});

  @override
  Widget build(BuildContext context) {
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
            overflow: TextOverflow.ellipsis,
            style: AppStyles.mainTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
