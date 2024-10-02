import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/widgets/loading_dialog.dart';
import 'package:mentorship/core/widgets/toast.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_state.dart';
import '../../../../../core/theming/text_styles.dart';

class ResendCode extends StatefulWidget {
  const ResendCode({super.key});

  @override
  State<ResendCode> createState() => _ResendCodeState();
}

class _ResendCodeState extends State<ResendCode> {
  DateTime timer = DateTime.now().add(
    const Duration(seconds: 30),
  );
  bool isTimerDone = false;

  @override
  Widget build(BuildContext context) {
    timer = DateTime.now().add(
      const Duration(seconds: 30),
    );
    return isTimerDone
        ? Align(
            alignment: Alignment.topLeft,
            child: BlocListener<SignupCubit, SignupState>(
              listener: (context, state) {
                state.whenOrNull(
                  resendOtpLoading: () {
                    loadingDialog(context);
                  },
                  resendOtpSuccess: (data) {
                    context.pop();
                  },
                  resendOtpFail: (error) {
                    context.pop();
                    showToast(message: error);
                  },
                );
              },
              child: GestureDetector(
                onTap: () {
                  context.read<SignupCubit>().resendOtp(
                      phoneNumber:
                          '+2${context.read<SignupCubit>().phoneNumberController.text}');
                  setState(() {
                    timer = DateTime.now().add(
                      const Duration(seconds: 30),
                    );
                    isTimerDone = false;
                  });
                  context.read<SignupCubit>().otpController.clear();
                },
                child: Text(
                  'Didn\'t you receive the code? Resend code',
                  style: AppTextStyles.font14Blue400UnderLine.copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Resend Code in ',
                style: AppTextStyles.font14Black400,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: TimerCountdown(
                  timeTextStyle: AppTextStyles.font14Black400,
                  onEnd: () {
                    setState(() {
                      isTimerDone = true;
                    });
                  },
                  endTime: timer,
                  format: CountDownTimerFormat.secondsOnly,
                  enableDescriptions: false,
                  spacerWidth: 3,
                ),
              ),
              Text(
                's',
                style: AppTextStyles.font14Black400,
              ),
            ],
          );
  }
}
