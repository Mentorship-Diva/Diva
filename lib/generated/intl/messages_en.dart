// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account? "),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "confirmPasswordIsNotValid": MessageLookupByLibrary.simpleMessage(
            "Confirm Password is not valid"),
        "confirmPasswordIsRequired": MessageLookupByLibrary.simpleMessage(
            "Confirm Password is required"),
        "donotHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account? "),
        "eightCharactersMinimum":
            MessageLookupByLibrary.simpleMessage("8 Characters Minimum"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "emailIsNotValid":
            MessageLookupByLibrary.simpleMessage("Email is not valid"),
        "emailIsRequired":
            MessageLookupByLibrary.simpleMessage("Email is required"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "mobile": MessageLookupByLibrary.simpleMessage("Mobile"),
        "oneLowerCharacter":
            MessageLookupByLibrary.simpleMessage("1 Lower Character"),
        "oneSpecialCharacter":
            MessageLookupByLibrary.simpleMessage("1 Special Character"),
        "oneUpperCharacter":
            MessageLookupByLibrary.simpleMessage("1 Upper Character"),
        "or": MessageLookupByLibrary.simpleMessage("Or"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordIsNotValid":
            MessageLookupByLibrary.simpleMessage("Password is not Valid"),
        "passwordIsRequired":
            MessageLookupByLibrary.simpleMessage("Password is required"),
        "phoneIsNotValid":
            MessageLookupByLibrary.simpleMessage("Phone is not valid"),
        "phoneIsRequired":
            MessageLookupByLibrary.simpleMessage("Phone is required"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back")
      };
}
