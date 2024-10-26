import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/helpers/dialogs.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/home/data/models/product_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/wishlist/data/models/product_model.dart';
import 'package:mentorship/features/wishlist/logic/cubit/wishlist_cubit.dart';
import 'package:mentorship/features/wishlist/logic/cubit/wishlist_state.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Color? heartIconColor;

  const ProductCard({super.key, required this.product, this.heartIconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getIt<HomeCubit>().navigateToProductDetails(product.id);
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
              Text(
                product.title,
                style: AppTextStyles.font14Weight400Grey,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10.h),
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
          BlocProvider.value(
            value: getIt<WishlistCubit>(),
            child: Positioned(
              top: 10,
              left: 10,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.8),
                child: BlocBuilder<WishlistCubit, WishlistState>(
                  builder: (context, wishlist) {
                    final isWishlisted = context
                        .read<WishlistCubit>()
                        .isInWishlist(product.id.toString());

                    return IconButton(
                      icon: Icon(
                        isWishlisted ? Icons.favorite : Icons.favorite_border,
                        color: isWishlisted ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        if (isWishlisted) {
                          context
                              .read<WishlistCubit>()
                              .removeFromWishlist(product.id.toString());
                          Dialogs.showItemRemovedDialog(
                              context, 'Item has been removed from wishlist');
                        } else {
                          context.read<WishlistCubit>().addToWishlist(
                              ProductModel(
                                  id: product.id.toString(),
                                  imageUrl: product.image,
                                  name: product.title,
                                  price: product.price,
                                  description: product.description,
                                  category: product.category,
                                  rating: product.rating));
                          Dialogs.showSuccessDialog(
                              context, 'Item has been added to wishlist');
                        }
                      },
                    );
                  },
                ),
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
