import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/text_styles.dart';

class CustomSettingsListTile extends StatelessWidget {
  const CustomSettingsListTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.leading,
  });

  final void Function()? onTap;
  final String title;
  final IconData leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: AppTextStyles.font16BlackSemiBold,
      ),
      leading: Icon(
        leading,
        color: Colors.black,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
      ),
    );
  }
}
