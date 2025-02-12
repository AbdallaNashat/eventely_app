import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class SnackBarService {
  static void showSuccessMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        return _buildToast(
          msg: msg,
          backgroundColor: Colors.green,
          icon: Icons.check_circle,
        );
      },
      duration: const Duration(seconds: 3),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        return _buildToast(
          msg: msg,
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
      },
      duration: const Duration(seconds: 3),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static Widget _buildToast({
    required String msg,
    required Color backgroundColor,
    required IconData icon,
  }) {
    return Card(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              msg,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}