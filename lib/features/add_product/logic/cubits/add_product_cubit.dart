import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  late TextEditingController productNameController;
  late TextEditingController productDescriptionController;
  late TextEditingController productPriceController;
  late TextEditingController productStockController;

  final List<String> sizes = [
    'XS',
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  List selectedSizes = [];
  final List<String> categories = [
    'Dress',
    'Jacket',
    'T-Shirt',
    'Pants',
    'Pajama',
    'Shoes',
    'Accessories',
    'Hijab',
  ];
  String selectedCategory = '';
}
