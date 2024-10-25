import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/text_styles.dart';

class BuildColorPicker extends StatefulWidget {
  const BuildColorPicker({super.key});

  @override
  State<BuildColorPicker> createState() => _BuildColorPickerState();
}

class _BuildColorPickerState extends State<BuildColorPicker> {
  // Dummy color names and color options
  final colors = ['Pink', 'Purple', 'Cyan', 'Yellow', 'Black'];
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
              'Color: ',
              style: AppTextStyles.font16BlackSemiBold(context),
            ),
            Text(colors[selectedColorIndex], // Display the selected color name
                style: AppTextStyles.font16BlackWeight400(context)),
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
