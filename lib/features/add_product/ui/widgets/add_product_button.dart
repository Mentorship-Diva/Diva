import 'package:flutter/material.dart';

import '../../../../core/widgets/app_main_button.dart';
import '../../../../generated/l10n.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppMainButton(
        onPressed: () {},
        title: S.of(context).addProduct,
      ),
    );
  }
}
