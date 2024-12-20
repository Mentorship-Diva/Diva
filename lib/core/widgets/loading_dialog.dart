import 'package:flutter/material.dart';

import '../theming/colors.dart';

loadingDialog(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.mainColor,
        ),
      );
    },
  );
}
