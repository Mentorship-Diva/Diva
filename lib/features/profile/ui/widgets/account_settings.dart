import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/features/profile/data/models/Enums/theme_state.dart';
import 'package:mentorship/features/profile/logic/cubit/app_theme_cubit.dart';
import 'package:mentorship/features/profile/logic/cubit/app_theme_state.dart';
import 'package:mentorship/features/profile/ui/widgets/custom_settings_list_tile.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        bool lightTheme = state is Light;
        return Container(
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white),
          child: Column(children: [
            CustomSettingsListTile(
              title: 'Theme',
              leading: Icons.color_lens_outlined,
              trailing: Switch(
                value: lightTheme,
                onChanged: (value) {
                  if (value) {
                    context.read<AppThemeCubit>().changeTheme(ThemeState.Light);
                  } else {
                    context.read<AppThemeCubit>().changeTheme(ThemeState.Dark);
                  }
                },
                activeColor: AppColors.mainPinkColor,
                inactiveThumbColor: AppColors.lightGreyColor,
              ),
            ),
            const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
            CustomSettingsListTile(
                onTap: () {},
                title: 'Personal information',
                leading: Icons.person_outline),
            const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
            CustomSettingsListTile(
                onTap: () {}, title: 'Payment methods', leading: Icons.payment),
            const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
            CustomSettingsListTile(
                onTap: () {},
                title: 'Addresses',
                leading: Icons.location_on_outlined),
            const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
            CustomSettingsListTile(
                onTap: () {},
                title: 'Measurements',
                leading: Icons.height_rounded),
            const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
            CustomSettingsListTile(
                onTap: () {},
                title: 'Notifications',
                leading: Icons.notifications_outlined),
          ]),
        );
      },
    );
  }
}
