import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<int> {
  MainCubit() : super(-1);

  //* Bottom navigation bar switching between screens
  void changeTab(int index) {
    emit(index);
  }
}
