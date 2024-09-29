import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../logic/cubits/signup_cubit.dart';
import '../../../logic/cubits/signup_state.dart';

class PicCodeForm extends StatelessWidget {
  const PicCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (current, previous) =>
      current is VerifyPhoneNumberLoading ||
          current is VerifyPhoneNumberSuccess ||
          current is VerifyPhoneNumberFail,
      listener: (context, state) {
        state.whenOrNull(verifyPhoneNumberLoading: () {
          loadingDialog(context);
        }, verifyPhoneNumberSuccess: (data) {
          context.pop();
        }, verifyPhoneNumberFail: (error) {
          context.pop();
          showToast(message: error);
        });
      },
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        pinTheme: PinTheme(
          borderRadius: BorderRadius.circular(100),
          shape: PinCodeFieldShape.box,
          fieldHeight: 48,
          fieldWidth: 50.w,
          activeColor: AppColors.lightGreyColor,
          selectedColor: AppColors.lightGreyColor,
          inactiveColor: AppColors.lightGreyColor.withOpacity(.5),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.digitsOnly,
        ],
        showCursor: true,
        onCompleted: (value) {
          context.read<SignupCubit>().verifyPhoneNumber(otp: value);
        },
      ),
    );
  }
}
