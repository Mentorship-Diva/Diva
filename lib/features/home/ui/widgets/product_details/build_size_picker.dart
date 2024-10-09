import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/colors.dart';

class BuildSizePicker extends StatefulWidget {
  @override
  _BuildSizePickerState createState() => _BuildSizePickerState();
}

class _BuildSizePickerState extends State<BuildSizePicker> {
  // Dummy size options
  final sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  // By default, the first size is selected
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Size: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              sizes[selectedSizeIndex], // Display the selected size
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: List.generate(sizes.length, (index) {
            return GestureDetector(
              onTap: () {
                // Update selected size logic
                setState(() {
                  selectedSizeIndex = index; // Update the selected size
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedSizeIndex == index
                        ? AppColors.mainColor
                        : AppColors.mainColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    sizes[index],
                    style: TextStyle(
                      color: selectedSizeIndex == index
                          ? Colors.white
                          : AppColors.mainColor,
                      fontWeight: selectedSizeIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
