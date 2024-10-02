import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';

class AppTextFormField extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final String? helperText;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Function()? onTap;
  final FocusNode? focus;
  final Function(String?)? onChanged;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatter;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  final double? borderRadius;
  final int? minLines;
  final int? maxLines;
  final bool? readOnly;

  const AppTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.helperText,
    this.isPassword = false,
    this.textInputAction,
    this.controller,
    this.suffixIcon,
    this.focus,
    this.onChanged,
    this.onEditingComplete,
    this.inputFormatter,
    this.onTap,
    this.contextMenuBuilder,
    this.borderRadius,
    this.minLines,
    this.maxLines,
    this.readOnly,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  double radius = 30;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines ?? 1,
      contextMenuBuilder: widget.contextMenuBuilder,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textAlignVertical: TextAlignVertical.center,
      autocorrect: false,
      onTap: widget.onTap,
      inputFormatters: widget.inputFormatter,
      autofocus: false,
      controller: widget.controller,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      onChanged: (value) {
        widget.onChanged != null ? widget.onChanged!(value) : null;
      },
      onEditingComplete: () {
        widget.onEditingComplete != null ? widget.onEditingComplete!() : null;
      },
      style: const TextStyle(
        color: AppColors.blackColor,
      ),
      cursorColor: AppColors.lightGreyColor,
      cursorHeight: 17,
      cursorWidth: 1.5,
      decoration: InputDecoration(
        hintText: widget.hintText,
        helperText: widget.helperText,
        suffixIcon: widget.suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
          color: AppColors.darkGreyColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? radius),
          borderSide: BorderSide(
            color: AppColors.lightGreyColor,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? radius),
          borderSide: BorderSide(
            color: AppColors.lightGreyColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? radius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? radius),
        ),
      ),
      obscureText: widget.isPassword!,
      obscuringCharacter: '*',
      validator: widget.validator,
      keyboardType: widget.keyboardType,
    );
  }
}
