import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentorship/core/networking/firebase/firebase_error_model.dart';

part 'firebase_result.freezed.dart';


@Freezed()
abstract class FirebaseResult<T> with _$FirebaseResult<T> {
  const factory FirebaseResult.success(T data) = Success<T>;
  const factory FirebaseResult.fail(FirebaseErrorModel firebaseErrorModel) = Fail<T>;
}