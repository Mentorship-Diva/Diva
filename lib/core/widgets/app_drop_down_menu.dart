import 'package:flutter/material.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';

class AppDropDownMenu extends StatelessWidget {
  const AppDropDownMenu({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.initValue,
    required this.values,
    this.hintColor,
  });

  final String hintText;
  final void Function(int? value) onChanged;
  final int? initValue;
  final List<String> values;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      textStyle: const TextStyle(
        fontSize: 16,
      ),
      child: DropdownButtonFormField(
        menuMaxHeight: context.screenHeight / 2,
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          color: AppColors.mainColor,
        ),
        value: initValue,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.lightGreyColor,
              ),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.lightGreyColor,
              ),
              borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
          ),
        ).copyWith(
          contentPadding: const EdgeInsetsDirectional.symmetric(
            // vertical: 10,
            horizontal: 12,
          ),
        ),
        onChanged: onChanged,
        items: List.generate(values.length, (index) {
          return DropdownMenuItem(
            value: index,
            child: Text(
              values[index],
              style: AppTextStyles.font12DarkGrey400,
            ),
          );
        }),
      ),
    );
  }
}
