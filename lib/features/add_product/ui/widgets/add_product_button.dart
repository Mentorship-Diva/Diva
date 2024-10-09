import 'package:flutter/material.dart';

import '../../../../core/widgets/app_main_button.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppMainButton(
        onPressed: () {},
        title: 'Add product',
      ),
    );
  }
}
