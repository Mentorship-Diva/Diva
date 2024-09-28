import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoriesList extends StatelessWidget {
  const ShimmerCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Adjust this number as needed
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            height: 55.0,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
          );
        },
      ),
    );
  }
}
