import 'package:flutter/material.dart';
import 'package:mentorship/core/Localization/localization_cubit.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/helpers/constants.dart';
import 'package:mentorship/core/theming/text_styles.dart';

import '../../../../../generated/l10n.dart';

class BuildColorPicker extends StatefulWidget {
  const BuildColorPicker({super.key});

  @override
  State<BuildColorPicker> createState() => _BuildColorPickerState();
}

class _BuildColorPickerState extends State<BuildColorPicker> {
  // Dummy color names and color options
  final colors = ['Pink', 'Purple', 'Cyan', 'Gray', 'Black'];
  final arabicColors = ['بينك', 'بنفسجي', 'ازرق', 'رمادي', 'اسود'];
  final colorOptions = [
    Colors.pink,
    Colors.deepPurple,
    Colors.cyan,
    Colors.blueGrey,
    Colors.black
  ];

  // By default, the first color is selected
  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              S.of(context).color,
              style: AppTextStyles.font16BlackSemiBold,
            ),
            Text(
              // Instead of put them in build to use context
                getIt<LocalizationCubit>().locale ==
                        SharedPreferencesValues.arabic
                    ? arabicColors[selectedColorIndex]
                    : colors[
                        selectedColorIndex], // Display the selected color name
                style: AppTextStyles.font16BlackWeight400),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: List.generate(colorOptions.length, (index) {
            return GestureDetector(
              onTap: () {
                // Update selected color logic
                setState(() {
                  selectedColorIndex = index; // Update the selected color
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  backgroundColor: colorOptions[index],
                  radius: 20,
                  child: selectedColorIndex == index
                      ? Icon(Icons.check, color: Colors.white)
                      : null,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
