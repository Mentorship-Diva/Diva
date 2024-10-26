import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/features/home/data/models/product_details_model.dart';
import 'package:share_plus/share_plus.dart';

class ImageWithButtons extends StatelessWidget {
  const ImageWithButtons({
    super.key,
    required this.product,
  });

  final ProductDetailsModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: product.image,
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
        ),
        Positioned(
          top: 40,
          left: 20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.mainScreen);
              },
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share(
                  'Check out this amazing product: ${product.title}\n'
                  'Price: \$${product.price}\n'
                  'Description: ${product.description}',
                  subject: 'Awesome Product: ${product.title}',
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
