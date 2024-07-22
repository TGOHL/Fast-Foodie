import 'package:flutter/material.dart';

import '../config/themes.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppThemes.secondaryLight,
        ),
      ),
    );
  }
}
