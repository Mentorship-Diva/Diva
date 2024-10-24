import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentorship/core/helpers/shared_prefrances_helper.dart';
import 'package:mentorship/core/networking/firebase/firebase_error_model.dart';
import 'package:mentorship/core/networking/firebase/firebase_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditUserRepo {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<FirebaseResult> setUserData(String name) async {
    String userEmail = await SharedPreferencesHelper.getData('userEmail') ?? '';
    try {
      if (userEmail != '') {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        User? currentUser = await _auth.currentUser;
        currentUser?.updateDisplayName(name);
        await SharedPreferencesHelper.setData('userName', name);
        return FirebaseResult.success('data');
      } else {
        print('FAIL');
        return FirebaseResult.fail(
          FirebaseErrorModel(
            message: 'No User Data',
            code: '0',
          ),
        );
      }
    } on FirebaseException catch (error) {
      return FirebaseResult.fail(FirebaseErrorModel(
        message: error.message ?? '',
        code: error.code,
      ));
    }
  }
}
