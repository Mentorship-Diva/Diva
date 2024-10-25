import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/text_styles.dart';

class CustomSettingsListTile extends StatelessWidget {
  const CustomSettingsListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.leading,
    this.trailing,
  });

  final void Function()? onTap;
  final String title;
  final IconData leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: AppTextStyles.font16BlackSemiBold(context),
      ),
      leading: Icon(
        leading,
      ),
      trailing: trailing !=null ? trailing : const Icon(
        Icons.arrow_forward_ios,
      ),
    );
  }
}
