import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final List<TextInputFormatter>? inputFormatter;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;

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
    this.inputFormatter,
    this.onTap,
    this.contextMenuBuilder,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  double radius = 30;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        setState(() {});
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
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.lightGreyColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColors.lightGreyColor,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColors.lightGreyColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      obscureText: widget.isPassword!,
      obscuringCharacter: '*',
      validator: widget.validator,
      keyboardType: widget.keyboardType,
    );
  }
}