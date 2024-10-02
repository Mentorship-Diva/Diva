import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/home/data/models/product_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          Routes.productDetailsScreen,
          arguments: product
              .id, // Ensure this matches your route's expected argument type
        );
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.h,
                ),
              ),
              const SizedBox(height: 5),
              // Product Name
              Text(
                product.title,
                style: AppTextStyles.font14Weight400Grey,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: AppTextStyles.font14WeightBoldBlack,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 15.sp),
                      SizedBox(width: 3.w),
                      Text(
                        product.rating.rate.toString(),
                        style: AppTextStyles.font14Weight400FadedBlack,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Favorite Icon (top-left)
          Positioned(
            top: 10,
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.8),
              child: IconButton(
                icon: const Icon(Icons.favorite_border),
                color: Colors.black,
                onPressed: () {
                  // Add favorite functionality
                },
              ),
            ),
          ),
          // Add to Cart Icon (bottom-right)
          Positioned(
            bottom: 73.h,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.8),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Colors.black,
                onPressed: () {
                  // Add to cart functionality
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
