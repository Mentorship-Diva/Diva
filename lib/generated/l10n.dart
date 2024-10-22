// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgetPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get donotHaveAnAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'donotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailIsRequired {
    return Intl.message(
      'Email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid`
  String get emailIsNotValid {
    return Intl.message(
      'Email is not valid',
      name: 'emailIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordIsRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is not Valid`
  String get passwordIsNotValid {
    return Intl.message(
      'Password is not Valid',
      name: 'passwordIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password is required`
  String get confirmPasswordIsRequired {
    return Intl.message(
      'Confirm Password is required',
      name: 'confirmPasswordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password is not valid`
  String get confirmPasswordIsNotValid {
    return Intl.message(
      'Confirm Password is not valid',
      name: 'confirmPasswordIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Phone is required`
  String get phoneIsRequired {
    return Intl.message(
      'Phone is required',
      name: 'phoneIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Phone is not valid`
  String get phoneIsNotValid {
    return Intl.message(
      'Phone is not valid',
      name: 'phoneIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `8 Characters Minimum`
  String get eightCharactersMinimum {
    return Intl.message(
      '8 Characters Minimum',
      name: 'eightCharactersMinimum',
      desc: '',
      args: [],
    );
  }

  /// `1 Upper Character`
  String get oneUpperCharacter {
    return Intl.message(
      '1 Upper Character',
      name: 'oneUpperCharacter',
      desc: '',
      args: [],
    );
  }

  /// `1 Lower Character`
  String get oneLowerCharacter {
    return Intl.message(
      '1 Lower Character',
      name: 'oneLowerCharacter',
      desc: '',
      args: [],
    );
  }

  /// `1 Special Character`
  String get oneSpecialCharacter {
    return Intl.message(
      '1 Special Character',
      name: 'oneSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `The Code Will Be Sent to `
  String get theCodeWillBeSentTo {
    return Intl.message(
      'The Code Will Be Sent to ',
      name: 'theCodeWillBeSentTo',
      desc: '',
      args: [],
    );
  }

  /// `Resend CodeIn`
  String get resendCodeIn {
    return Intl.message(
      'Resend CodeIn',
      name: 'resendCodeIn',
      desc: '',
      args: [],
    );
  }

  /// `Did not you receive receive the code? Resend code`
  String get didNotYouReceiveTheCode {
    return Intl.message(
      'Did not you receive receive the code? Resend code',
      name: 'didNotYouReceiveTheCode',
      desc: '',
      args: [],
    );
  }

  /// ` s `
  String get seconds {
    return Intl.message(
      ' s ',
      name: 'seconds',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, `
  String get welcome {
    return Intl.message(
      'Welcome, ',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `you might also like: `
  String get youMightAlsoLike {
    return Intl.message(
      'you might also like: ',
      name: 'youMightAlsoLike',
      desc: '',
      args: [],
    );
  }

  /// `reviews`
  String get reviews {
    return Intl.message(
      'reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Color: `
  String get color {
    return Intl.message(
      'Color: ',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Size: `
  String get size {
    return Intl.message(
      'Size: ',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message(
      'Buy Now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `TOTAL`
  String get total {
    return Intl.message(
      'TOTAL',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Order Items`
  String get orderItems {
    return Intl.message(
      'Order Items',
      name: 'orderItems',
      desc: '',
      args: [],
    );
  }

  /// `Save On Your Items`
  String get saveOnYourItems {
    return Intl.message(
      'Save On Your Items',
      name: 'saveOnYourItems',
      desc: '',
      args: [],
    );
  }

  /// `Pay With`
  String get payWith {
    return Intl.message(
      'Pay With',
      name: 'payWith',
      desc: '',
      args: [],
    );
  }

  /// `Enter your voucher code`
  String get enterYourVoucherCode {
    return Intl.message(
      'Enter your voucher code',
      name: 'enterYourVoucherCode',
      desc: '',
      args: [],
    );
  }

  /// `Select your payment method`
  String get selectPaymentMethod {
    return Intl.message(
      'Select your payment method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Calculating Coast`
  String get calculatingCoast {
    return Intl.message(
      'Calculating Coast',
      name: 'calculatingCoast',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Fee`
  String get deliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'deliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message(
      'Place Order',
      name: 'placeOrder',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeLocation {
    return Intl.message(
      'Home',
      name: 'homeLocation',
      desc: '',
      args: [],
    );
  }

  /// `Office`
  String get office {
    return Intl.message(
      'Office',
      name: 'office',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get addProduct {
    return Intl.message(
      'Add Product',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  /// `Product Images`
  String get productImages {
    return Intl.message(
      'Product Images',
      name: 'productImages',
      desc: '',
      args: [],
    );
  }

  /// `Click to Upload`
  String get clickToUploadImage {
    return Intl.message(
      'Click to Upload',
      name: 'clickToUploadImage',
      desc: '',
      args: [],
    );
  }

  /// `General Info`
  String get generalInfo {
    return Intl.message(
      'General Info',
      name: 'generalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get productDescription {
    return Intl.message(
      'Product Description',
      name: 'productDescription',
      desc: '',
      args: [],
    );
  }

  /// `Pick Available Size`
  String get pickAvailableSize {
    return Intl.message(
      'Pick Available Size',
      name: 'pickAvailableSize',
      desc: '',
      args: [],
    );
  }

  /// `Pick Available color`
  String get pickAvailableColor {
    return Intl.message(
      'Pick Available color',
      name: 'pickAvailableColor',
      desc: '',
      args: [],
    );
  }

  /// `Pick Available categories`
  String get pickAvailableCategories {
    return Intl.message(
      'Pick Available categories',
      name: 'pickAvailableCategories',
      desc: '',
      args: [],
    );
  }

  /// `Pricing & Stock`
  String get pricingAndStock {
    return Intl.message(
      'Pricing & Stock',
      name: 'pricingAndStock',
      desc: '',
      args: [],
    );
  }

  /// `Pricing`
  String get pricing {
    return Intl.message(
      'Pricing',
      name: 'pricing',
      desc: '',
      args: [],
    );
  }

  /// `Stock`
  String get stock {
    return Intl.message(
      'Stock',
      name: 'stock',
      desc: '',
      args: [],
    );
  }

  /// `Variants`
  String get variants {
    return Intl.message(
      'Variants',
      name: 'variants',
      desc: '',
      args: [],
    );
  }

  /// `Add one`
  String get addOne {
    return Intl.message(
      'Add one',
      name: 'addOne',
      desc: '',
      args: [],
    );
  }

  /// `No variants yet`
  String get noVariantsYet {
    return Intl.message(
      'No variants yet',
      name: 'noVariantsYet',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
