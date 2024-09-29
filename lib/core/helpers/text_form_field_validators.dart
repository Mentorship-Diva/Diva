import 'package:mentorship/core/helpers/app_regex.dart';

class TextFormFieldValidators {
  static emailValidator(value, context) {
    if (value!.isEmpty) {
      return 'E-mail is required';
    } else if (!AppRegex.isEmailValid(value)) {
      return 'E-mail is not valid';
    } else if (value.contains(' ')) {
      return 'E-mail is not valid';
    }
    return null;
  }

  static passwordValidator(value, context) {
    if (value!.isEmpty) {
      return 'Password is required';
    } else if (!AppRegex.isPasswordValid(value)) {
      return 'Password is not valid';
    }
    return null;
  }

  static phoneNumberValidator(value, context) {
    if (value!.isEmpty) {
      return 'Phone number is required';
    } else if (!AppRegex.isPhoneNumberValid(value)) {
      return 'Phone number is not valid';
    }
    return null;
  }
}
