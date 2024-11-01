import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/features/profile/ui/widgets/custom_settings_list_tile.dart';
import '../../../notifications/ui/screens/notifications_screen.dart';

import '../../../../generated/l10n.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          CustomSettingsListTile(
            onTap: () {},
            title: S.of(context).personalInformation,
            leading: Icons.person_outline,
          ),
          const Divider(
            color: AppColors.lightGreyColor,
            thickness: 0.3,
          ),
          CustomSettingsListTile(
            onTap: () {},
            title: 'Addresses',
            leading: Icons.location_on_outlined),
        const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
        CustomSettingsListTile(
            onTap: () {}, title: 'Measurements', leading: Icons.height_rounded),
        const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
        CustomSettingsListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return NotificationsScreen();
              }));
            },
            title: 'Notifications',
            leading: Icons.notifications_outlined),
      ]),
            title: S.of(context).paymentMethods,
            leading: Icons.payment,
          ),
          const Divider(
            color: AppColors.lightGreyColor,
            thickness: 0.3,
          ),
          // CustomSettingsListTile(
          //     onTap: () {},
          //     title: 'Addresses',
          //     leading: Icons.location_on_outlined),
          // const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
          // CustomSettingsListTile(
          //     onTap: () {}, title: 'Measurements', leading: Icons.height_rounded),
          // const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
          CustomSettingsListTile(
            onTap: () {},
            title: S.of(context).notifications,
            leading: Icons.notifications_outlined,
          ),
        ],
      ),
    );
  }
}
