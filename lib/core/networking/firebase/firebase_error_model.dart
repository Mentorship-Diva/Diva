class FirebaseErrorModel {
  final String? code;
  final String? message;

  FirebaseErrorModel({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    return 'Error Code: $code, Message: $message';
  }
}
