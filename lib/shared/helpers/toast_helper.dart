import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fast_foodie/shared/config/styles.dart';

class ToastHelper {
  final BuildContext context;

  ToastHelper(this.context);
  void showSuccess(String message) {
    showToast(
      icon: Icons.check,
      message: message,
      iconColor: Colors.green,
    );
  }

  void showError(String message) {
    showToast(
      icon: Icons.error,
      message: message,
      iconColor: Colors.red,
    );
  }

  factory ToastHelper.of(context) => ToastHelper(context);

  void showToast({
    required IconData icon,
    required String message,
    required Color iconColor,
  }) {
    FToast().init(context).showToast(
          gravity: ToastGravity.TOP,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.black,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: iconColor),
                const SizedBox(width: 12),
                Expanded(child: Text(message, style: AppStyles.toastTextStyle)),
              ],
            ),
          ),
        );
  }
}
