import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/text_styles.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.isSelected,
    required this.category,
  });

  final bool isSelected;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.pink : Colors.pink.shade50,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          category,
          style: AppTextStyles.font14Weight400Black(context).copyWith(
            color: isSelected ? Colors.white : Colors.pink,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
