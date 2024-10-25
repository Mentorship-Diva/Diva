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
      borderRadius: BorderRadius.circular(16),
      textStyle: const TextStyle(
        fontSize: 16,
      ),
      child: DropdownButtonFormField(
        menuMaxHeight: context.screenHeight / 2,
        icon: Icon(
          Icons.arrow_drop_down,
          color: AppColors.mainColor,
          size: 12,
        ),
        value: initValue,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.lightGreyColor,
              ),
              borderRadius: BorderRadius.circular(16)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.lightGreyColor,
              ),
              borderRadius: BorderRadius.circular(16)),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
        ),
        onChanged: onChanged,
        items: List.generate(
          values.length,
          (index) {
            return DropdownMenuItem(
              value: index,
              child: Text(
                values[index],
                style: AppTextStyles.font12DarkGrey400(context),
              ),
            );
          },
        ),
        isExpanded: true,
      ),
    );
  }
}
