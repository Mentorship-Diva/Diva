import 'package:flutter/material.dart';

class BannersSection extends StatefulWidget {
  const BannersSection({super.key});

  @override
  _BannersSectionState createState() => _BannersSectionState();
}

class _BannersSectionState extends State<BannersSection> {
  // List of banner image paths
  final List<String> imagePaths = [
    'assets/images/banners/banner2.png',
    'assets/images/banners/banner1.png',
    'assets/images/banners/banner3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.0, // Set height for the list
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        padding: const EdgeInsets.only(left: 20.0), // Padding on the left side
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Container(
            width:
                MediaQuery.of(context).size.width * 0.87, // Width of each item
            margin: const EdgeInsets.only(right: 15.0), // Spacing between items
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Rounded corners
              image: DecorationImage(
                image: AssetImage(imagePaths[index]),
                fit: BoxFit.fill, // Ensure image covers the container
              ),
            ),
          );
        },
      ),
    );
  }
}
