import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/profile/ui/screens/edit_personal_information_screen.dart';
import '../../logic/profile_cubit.dart';
import '../../logic/profile_state.dart';

class UserAccountInfo extends StatelessWidget {
  const UserAccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return ListTile(
            onTap: () {},
            leading: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.lightPinkColor,
              child: Text("${state is GetUserData ? state.user.name![0] : ''}",
                  style: AppTextStyles.font18PrimaryColorMedium),
            ),
            title: Text(
              'Hello, ${state is GetUserData ? state.user.name : ''}',
            ),
            subtitle: Text(
              state is GetUserData ? state.user.email : '',
            ),
            trailing: GestureDetector(
              onTap: () {
                context.push(EditPersonalInformationScreen());
              },
              child: Container(
                width: 43.w,
                height: 20.h,
                decoration: const BoxDecoration(
                  color: AppColors.mainPinkColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(13),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Edit',
                    style: AppTextStyles.font14WhiteSemiBold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
