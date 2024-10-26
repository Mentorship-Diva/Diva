import 'package:carousel_slider/carousel_slider.dart';
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
    return CarouselSlider(
      items: imagePaths.map((path) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(path),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 160.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        viewportFraction: 0.87,
        enableInfiniteScroll: true,
      ),
    );
  }
}
