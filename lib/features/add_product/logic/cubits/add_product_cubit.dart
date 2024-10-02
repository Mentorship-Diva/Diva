import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  late TextEditingController productNameController;
  late TextEditingController productDescriptionController;
}
