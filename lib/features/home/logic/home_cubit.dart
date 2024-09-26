import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(-1);
  //* Update the selected category index
  void selectCategory(int index) {
    emit(index);
  }
}
