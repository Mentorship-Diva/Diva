import 'package:flutter/material.dart';

class BuyNowBar extends StatelessWidget {
  const BuyNowBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Favorite icon
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // Handle favorite action
                },
              ),
            ),
            // Buy Now Button
            ElevatedButton(
              onPressed: () {
                // Handle Buy Now action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink, // Button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                // Ensuring good text visibility
                textStyle: TextStyle(
                  fontSize: 25, // Font size
                  fontWeight:
                      FontWeight.bold, // Bold text to enhance visibility
                  color: Colors.black, // Ensure text color is set
                ),
              ),
              child: Text(
                'Buy Now',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight
                      .bold, // Optional: Add weight to make it more visible
                  color: Colors
                      .white, // White might work better for contrast on a pink button
                ),
              ),
            ),

            // Add to Cart icon
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  // Handle add to cart action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
