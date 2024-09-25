import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(-1); // Initialize with no selection (-1)

  //* Update the selected category index
  void selectCategory(int index) {
    emit(index);
  }

  //* Bottom navigation bar switching between screens
  void changeTab(int index) {
    emit(index);
  }
}
