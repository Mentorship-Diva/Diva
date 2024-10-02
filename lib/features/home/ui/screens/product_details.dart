import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/logic/home_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<HomeCubit>()..loadProductDetails(productId.toString()),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is! HomeProductDetailsError,
        builder: (context, state) {
          if (state is HomeProductDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeProductDetailsSuccess) {
            final product = state.product;
            return Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            product.image,
                            height: MediaQuery.of(context).size.height / 2,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 40,
                            left: 20,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () => Navigator.pop(context),
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
                                  // Share logic
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.8,
                                  child: Text(
                                    product.title,
                                    style: AppTextStyles.font16BlackWeight400,
                                    maxLines: 1,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    Text(
                                        '${product.rating.rate} (${product.rating.count} reviews)'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "\$${product.price}",
                              style: AppTextStyles.font24BlackWeight600,
                            ),
                            SizedBox(height: 10),
                            Text(product.description),
                            SizedBox(height: 20),
                            _buildColorPicker(),
                            SizedBox(height: 20),
                            _buildSizePicker(),
                            SizedBox(height: 30),
                            Text(
                              'You might like:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            _buildSuggestedProducts(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is HomeProductDetailsError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildColorPicker() {
    // Dummy color names and color options
    final colors = ['Red', 'Blue', 'Green', 'Yellow', 'Black'];
    final colorOptions = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.black
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          children: List.generate(colorOptions.length, (index) {
            return GestureDetector(
              onTap: () {
                // Update selected color logic
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  backgroundColor: colorOptions[index],
                  radius: 20,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSizePicker() {
    // Dummy size options
    final sizes = ['S', 'M', 'L', 'XL', 'XXL'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          children: List.generate(sizes.length, (index) {
            return GestureDetector(
              onTap: () {
                // Update selected size logic
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(sizes[index]),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSuggestedProducts() {
    // Dummy suggested product list (you can replace this with actual product data)
    final suggestedProducts = [
      'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
      'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',
      'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: suggestedProducts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.network(suggestedProducts[index],
                width: 100, fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}
