import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/features/profile/logic/profile_cubit.dart';
import 'package:mentorship/features/profile/logic/profile_state.dart';

import '../widgets/user_data_value.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 400.h,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 320.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            // padding: EdgeInsets.all(24),
                            child: Stack(
                              children: [
                                BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: -10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.lightPinkColor
                                          .withOpacity(.2),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      UserDataValue(
                                        title: 'Name',
                                        value: context
                                            .read<ProfileCubit>()
                                            .userName,
                                      ),
                                      UserDataValue(
                                        title: 'Email',
                                        value: context
                                            .read<ProfileCubit>()
                                            .userEmail,
                                      ),
                                      UserDataValue(
                                        title: 'Mobile number',
                                        value: '01011111111',
                                      ),
                                      UserDataValue(
                                        title: 'Location',
                                        value: 'Egypt',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.lightPinkColor,
                            ),
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Image.asset(
                                AppAssets.womanAvatar,
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}