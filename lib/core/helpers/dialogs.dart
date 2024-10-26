import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mentorship/core/theming/colors.dart';

class Dialogs {
  static Future<void> showSuccessDialog(
      BuildContext context, String message) async {
    _showLottieDialog(
      context,
      'assets/animations/success.json',
      message,
    );
  }

  static Future<void> showFailureDialog(
      BuildContext context, String message) async {
    _showLottieDialog(
      context,
      'assets/animations/fail.json',
      message,
    );
  }

  static Future<void> showItemRemovedDialog(
      BuildContext context, String message) async {
    _showLottieDialog(
      context,
      'assets/animations/remove.json',
      message,
    );
  }

  static Future<void> _showLottieDialog(
    BuildContext context,
    String lottiePath,
    String message,
  ) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(lottiePath,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  repeat: false,
                  frameRate: FrameRate.max),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pinkColor),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
