import 'package:mentorship/core/helpers/app_regex.dart';

import '../../generated/l10n.dart';

class TextFormFieldValidators {
  static emailValidator(value, context) {
    if (value!.isEmpty) {
      return S.of(context).emailIsRequired;
    } else if (!AppRegex.isEmailValid(value)) {
      return S.of(context).emailIsNotValid;
    } else if (value.contains(' ')) {
      return S.of(context).emailIsNotValid;
    }
    return null;
  }

  static passwordValidator(value, context) {
    if (value!.isEmpty) {
      return S.of(context).passwordIsRequired;
    } else if (!AppRegex.isPasswordValid(value)) {
      return S.of(context).passwordIsNotValid;
    }
    return null;
  }

  static phoneNumberValidator(value, context) {
    if (value!.isEmpty) {
      return S.of(context).phoneIsRequired;
    } else if (!AppRegex.isPhoneNumberValid(value)) {
      return S.of(context).phoneIsNotValid;
    }
    return null;
  }

  static nameValidator(value, context) {
    if (value!.isEmpty) {
      return 'Name is required';
    } else if (!AppRegex.isNameValid(value)) {
      return 'Name is not valid';
    }
    return null;
  }
}
