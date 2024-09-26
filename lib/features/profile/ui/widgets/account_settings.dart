import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/features/profile/ui/widgets/custom_settings_list_tile.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: Column(children: [
        CustomSettingsListTile(
            onTap: () {},
            title: 'Personal information',
            leading: Icons.person_outline),
        const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
        CustomSettingsListTile(
            onTap: () {}, title: 'Peyment methods', leading: Icons.payment),
        const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
        CustomSettingsListTile(
            onTap: () {},
            title: 'Addresses',
            leading: Icons.location_on_outlined),
        const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
        CustomSettingsListTile(
            onTap: () {}, title: 'Measurements', leading: Icons.height_rounded),
        const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
        CustomSettingsListTile(
            onTap: () {},
            title: 'Notifications',
            leading: Icons.notifications_outlined),
      ]),
    );
  }
}
