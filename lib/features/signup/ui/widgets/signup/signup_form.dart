import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import 'package:mentorship/features/signup/ui/widgets/signup/signup_with_email_form.dart';
import 'package:mentorship/features/signup/ui/widgets/signup/signup_with_number_form.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
  }

  void flip() {
    if (!context.read<SignupCubit>().isEmailForm) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  context.read<SignupCubit>().isEmailForm = true;
                });
                flip();
              },
              child: Text(
                'E-mail',
                style: AppTextStyles.font14Black400.copyWith(
                  color: context.read<SignupCubit>().isEmailForm
                      ? AppColors.mainColor
                      : AppColors.lightGreyColor,
                ),
              ),
            ),
            Container(
              width: 1,
              height: 15,
              color: AppColors.lightGreyColor,
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  context.read<SignupCubit>().isEmailForm = false;
                });
                flip();
              },
              child: Text(
                'Mobile',
                style: AppTextStyles.font14Black400.copyWith(
                  color: !context.read<SignupCubit>().isEmailForm
                      ? AppColors.mainColor
                      : AppColors.lightGreyColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 170.h),
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final angle = animation.value * pi;
              final transform = Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle);
              return Transform(
                transform: transform,
                alignment: Alignment.center,
                child: animation.value < 0.5
                    ? const SignupWithEmailForm()
                    : Transform(
                        transform: Matrix4.identity()..rotateY(pi),
                        alignment: Alignment.center,
                        child: const SignupWithNumberForm(),
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}
