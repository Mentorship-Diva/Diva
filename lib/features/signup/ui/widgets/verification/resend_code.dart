import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

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
            child: GestureDetector(
              onTap: () {
                setState(() {
                  timer = DateTime.now().add(
                    const Duration(seconds: 30),
                  );
                  isTimerDone = false;
                });
              },
              child: Text(
                'Didn\'t you receive the code? Resend code',
                style: AppTextStyles.font14Blue400UnderLine.copyWith(
                  decoration: TextDecoration.none,
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
