import 'package:flutter/material.dart';
import 'package:mentorship/core/widgets/app_main_button.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainButton(onPressed: () {}, title: 'Sign in');
  }
}
