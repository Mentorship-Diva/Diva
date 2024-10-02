import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  late TextEditingController productNameController;
  late TextEditingController productDescriptionController;
  late TextEditingController productPriceController;
  late TextEditingController productStockController;
  late TextEditingController productColorController;

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

  final ImagePicker picker = ImagePicker();
  List<File?> selectedImages = [null, null, null];
}
