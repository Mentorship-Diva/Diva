import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/text_styles.dart';

class CustomSettingsListTile extends StatelessWidget {
  CustomSettingsListTile(
      {super.key,
      required this.onTap,
      required this.title,
      required this.leading});
  void Function()? onTap;
  String title;
  IconData leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        title: Text(title, style: TextStyles.font16BlackSemiBold),
        leading: Icon(leading, color: Colors.black),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black));
  }
}
