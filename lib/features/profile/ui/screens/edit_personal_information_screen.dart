import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/helpers/text_form_field_validators.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/core/widgets/app_main_button.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';
import 'package:mentorship/features/profile/logic/profile_cubit.dart';
import 'package:mentorship/features/profile/logic/profile_state.dart';

import '../../../../core/widgets/loading_dialog.dart';

class EditPersonalInformationScreen extends StatelessWidget {
  const EditPersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit personal information'),
        centerTitle: true,
      ),
      body: BlocProvider.value(
        value: getIt<ProfileCubit>(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            print(state);
            state.whenOrNull(
              setUserDataLoading: () {
                loadingDialog(context);
              },
              setUserDataSuccess: (data) {
                context.pop();
              },
              setUserDataFail: (error) {
                context.pop();
              },
            );
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Text(
                          'Personal information',
                          style: AppTextStyles.font18Black400,
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        Form(
                          key: context.read<ProfileCubit>().formKey,
                          child: Column(
                            children: [
                              AppTextFormField(
                                hintText: 'Name',
                                controller:
                                    context.read<ProfileCubit>().nameController,
                                validator: (value) =>
                                    TextFormFieldValidators.nameValidator(
                                        value, context),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppMainButton(
                    onPressed: () {
                      if (context
                          .read<ProfileCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<ProfileCubit>().setUserData(
                              userName: context
                                  .read<ProfileCubit>()
                                  .nameController
                                  .text,
                            );
                      }
                    },
                    title: 'Set Data',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
