import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/widgets/successful_bottom_sheet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../logic/cubits/signup_cubit.dart';
import '../../../logic/cubits/signup_state.dart';

class PicCodeForm extends StatefulWidget {
   PicCodeForm({super.key});

  @override
  State<PicCodeForm> createState() => _PicCodeFormState();
}

class _PicCodeFormState extends State<PicCodeForm> {
  final shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        print(state);
        state.whenOrNull(
          verifyPhoneNumberLoading: () {
            loadingDialog(context);
          },
          verifyPhoneNumberSuccess: (data) {
            context.pop();
            successfulBottomSheet(context);
          },
          verifyPhoneNumberFail: (error) {
            context.pop();
            shakeKey.currentState!.shake();
            showToast(message: error);
          },
        );
      },
      child: ShakeMe(
        key: shakeKey,
        shakeCount: 2,
        shakeDuration: const Duration(milliseconds: 600),
        shakeOffset: 10,
        child: PinCodeTextField(
          controller: context.read<SignupCubit>().otpController,
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
            setState(() {
              context.read<SignupCubit>().otpController.text = value;
            });
            context.read<SignupCubit>().verifyPhoneNumber(otp: value);
          },
        ),
      ),
    );
  }
}
