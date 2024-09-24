import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theming/colors.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatefulWidget {
  final int? errorMaxLines;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  bool? isPassword;
  final TextInputType? keyboardType;
  final String? helperText;
  final String initialValue;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? suffix;
  final bool? suffixToggle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final IconData? suffixIconToggle;
  final Color? suffixIconColorToggle;
  final Function()? suffixOnPressed;
  final Function()? onTap;
  final FocusNode? focus;
  final Function(String?)? onChanged;
  final bool? readOnly;
  final bool? enabled;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  final int? minLines;
  final int? maxLines;
  final Color? borderColor;
  final Color? fillColor;
  final bool? filled;
  final String? labelText;
  final bool? enableInteractiveSelection;
  Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  final TextDirection?  textDirection;
  final Color? hintColor;
  final double? hintSize;
  final FontWeight? hintFontWeight;
  final double? radius;

  AppTextFormField({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.helperText,
    this.isPassword = false,
    this.initialValue = 'initial',
    this.onEditingComplete,
    this.textInputAction,
    this.controller,
    this.suffix = false,
    this.suffixToggle = false,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconToggle,
    this.suffixIconColorToggle,
    this.suffixOnPressed,
    this.focus,
    this.onChanged,
    this.errorMaxLines,
    this.readOnly,
    this.enabled,
    this.inputFormatter,
    this.onTap,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.borderColor,
    this.fillColor,
    this.filled,
    this.labelText,
    this.enableInteractiveSelection,
    this.contextMenuBuilder,
    this.textDirection,
    this.hintColor,
    this.hintSize,
    this.hintFontWeight,
    this.radius,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {

  double radius = 30;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.textDirection ?? TextDirection.ltr,
      child: TextFormField(
        contextMenuBuilder: widget.contextMenuBuilder,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        textAlignVertical: TextAlignVertical.center,
        autocorrect: false,
        maxLines: widget.maxLines ?? 1,
        minLines: widget.minLines ?? 1,
        onTap: widget.onTap,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatter,
        autofocus: false,
        readOnly: widget.readOnly ?? false,
        enabled: widget.enabled ?? true,
        enableInteractiveSelection: widget.enableInteractiveSelection ?? true,
        controller: widget.controller,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        onChanged: (value) {
          widget.onChanged != null ? widget.onChanged!(value) : null;
          setState(() {

          });
        },
        style: const TextStyle(
          color:  AppColors.blackColor,
        ),
        cursorColor: AppColors.lightGreyColor,
        cursorHeight: 17,
        cursorWidth: 1.5,
        decoration: InputDecoration(
          fillColor: widget.fillColor ?? AppColors.whiteColor,
          filled: widget.filled ?? false,
          errorMaxLines: widget.errorMaxLines,
          hintText: widget.hintText,
          helperText: widget.helperText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: widget.labelText,
          hintStyle: TextStyle(
            fontSize: widget.hintSize ?? 14,
            fontWeight:  widget.hintFontWeight ?? FontWeight.w400,
            color: widget.hintColor ?? AppColors.lightGreyColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? radius),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.lightGreyColor,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? radius),
            borderSide:  BorderSide(
              color: AppColors.lightGreyColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? radius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? radius),
          ),
        ),
        obscureText: widget.isPassword!,
        obscuringCharacter: '*',
        validator: widget.validator,
        onSaved: (value) {
          widget.onSaved != null ? widget.onSaved!(value) : null;
        },
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
