import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../logic/cubits/signup_cubit.dart';
import '../../../logic/cubits/signup_state.dart';

class PicCodeForm extends StatelessWidget {
   PicCodeForm({super.key});

  final shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (current, previous) =>
          current is VerifyPhoneNumberLoading ||
          current is VerifyPhoneNumberSuccess ||
          current is VerifyPhoneNumberFail,
      listener: (context, state) {

        print(state);

        state.whenOrNull(
          verifyPhoneNumberLoading: () {
            loadingDialog(context);
          },
          verifyPhoneNumberSuccess: (data) {
            // context.pop();
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                builder: (context) {
                  return Container(
                    width: context.screenWidth,
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppAssets.checkCircle),
                        Text('SUCCESS'),
                      ],
                    ),
                  );
                });
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
      ),
    );
  }
}
