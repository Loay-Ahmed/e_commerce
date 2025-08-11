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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Skip`
  String get splashskip {
    return Intl.message('Skip', name: 'splashskip', desc: '', args: []);
  }

  /// `Welcome to`
  String get splash_1_title {
    return Intl.message(
      'Welcome to',
      name: 'splash_1_title',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide collection of premium fresh fruits and get the best deals and high quality.`
  String get splash_1_text {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide collection of premium fresh fruits and get the best deals and high quality.',
      name: 'splash_1_text',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get splash_2_title {
    return Intl.message(
      'Search and Shop',
      name: 'splash_2_title',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the finest carefully selected fruits. Browse details, photos, and reviews to ensure you choose the perfect fruit`
  String get splash_2_text {
    return Intl.message(
      'We offer you the finest carefully selected fruits. Browse details, photos, and reviews to ensure you choose the perfect fruit',
      name: 'splash_2_text',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get splash_button {
    return Intl.message('Start Now', name: 'splash_button', desc: '', args: []);
  }

  /// `Home`
  String get nav_bar_home {
    return Intl.message('Home', name: 'nav_bar_home', desc: '', args: []);
  }

  /// `Products`
  String get nav_bar_products {
    return Intl.message(
      'Products',
      name: 'nav_bar_products',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get nav_bar_cart {
    return Intl.message(
      'Shopping Cart',
      name: 'nav_bar_cart',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get nav_bar_my_profile {
    return Intl.message(
      'My Profile',
      name: 'nav_bar_my_profile',
      desc: '',
      args: [],
    );
  }

  /// `Pound`
  String get pound {
    return Intl.message('Pound', name: 'pound', desc: '', args: []);
  }

  /// `Kilo`
  String get kilo {
    return Intl.message('Kilo', name: 'kilo', desc: '', args: []);
  }

  /// `Code Verification`
  String get verification_code_title {
    return Intl.message(
      'Code Verification',
      name: 'verification_code_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code we sent to your phone number`
  String get enter_code_text {
    return Intl.message(
      'Enter the code we sent to your phone number',
      name: 'enter_code_text',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verify_code {
    return Intl.message('Verify Code', name: 'verify_code', desc: '', args: []);
  }

  /// `Resend Code`
  String get resend_code {
    return Intl.message('Resend Code', name: 'resend_code', desc: '', args: []);
  }

  /// `Forgot Password`
  String get forgot_password_title {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, just enter your phone number and we'll send you a verification code.`
  String get forgot_password_text {
    return Intl.message(
      'Don\'t worry, just enter your phone number and we\'ll send you a verification code.',
      name: 'forgot_password_text',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Don't have an account`
  String get no_account {
    return Intl.message(
      'Don\'t have an account',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get login_with_google {
    return Intl.message(
      'Login with Google',
      name: 'login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get login_with_apple {
    return Intl.message(
      'Login with Apple',
      name: 'login_with_apple',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get login_with_facebook {
    return Intl.message(
      'Login with Facebook',
      name: 'login_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Create a new password to login`
  String get create_new_password_text {
    return Intl.message(
      'Create a new password to login',
      name: 'create_new_password_text',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get create_new_password {
    return Intl.message(
      'Create New Password',
      name: 'create_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get password_changed_success {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed_success',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get new_account {
    return Intl.message('New Account', name: 'new_account', desc: '', args: []);
  }

  /// `Create New Account`
  String get create_new_account {
    return Intl.message(
      'Create New Account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Agree to our terms and conditions`
  String get agree_terms {
    return Intl.message(
      'Agree to our terms and conditions',
      name: 'agree_terms',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `You have`
  String get you_have {
    return Intl.message('You have', name: 'you_have', desc: '', args: []);
  }

  /// `products in shopping cart`
  String get products_in_cart {
    return Intl.message(
      'products in shopping cart',
      name: 'products_in_cart',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Payment and Review`
  String get payment_and_review {
    return Intl.message(
      'Payment and Review',
      name: 'payment_and_review',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Please confirm your order`
  String get please_confirm_order {
    return Intl.message(
      'Please confirm your order',
      name: 'please_confirm_order',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get delivery_address {
    return Intl.message(
      'Delivery Address',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Please enter full name`
  String get please_enter_full_name {
    return Intl.message(
      'Please enter full name',
      name: 'please_enter_full_name',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Please enter email`
  String get please_enter_email {
    return Intl.message(
      'Please enter email',
      name: 'please_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get please_enter_valid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'please_enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter address`
  String get please_enter_address {
    return Intl.message(
      'Please enter address',
      name: 'please_enter_address',
      desc: '',
      args: [],
    );
  }

  /// `Please enter city`
  String get please_enter_city {
    return Intl.message(
      'Please enter city',
      name: 'please_enter_city',
      desc: '',
      args: [],
    );
  }

  /// `Floor number, apartment number..`
  String get floor_apartment_hint {
    return Intl.message(
      'Floor number, apartment number..',
      name: 'floor_apartment_hint',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get order_summary {
    return Intl.message(
      'Order Summary',
      name: 'order_summary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal:`
  String get subtotal {
    return Intl.message('Subtotal:', name: 'subtotal', desc: '', args: []);
  }

  /// `Delivery`
  String get delivery {
    return Intl.message('Delivery', name: 'delivery', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Choose suitable payment method`
  String get choose_payment_method {
    return Intl.message(
      'Choose suitable payment method',
      name: 'choose_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Please choose the payment method that suits you`
  String get please_choose_payment_method {
    return Intl.message(
      'Please choose the payment method that suits you',
      name: 'please_choose_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Cash on Delivery`
  String get cash_on_delivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cash_on_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Pickup Delivery`
  String get pickup_delivery {
    return Intl.message(
      'Pickup Delivery',
      name: 'pickup_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now Pay Later`
  String get buy_now_pay_later {
    return Intl.message(
      'Buy Now Pay Later',
      name: 'buy_now_pay_later',
      desc: '',
      args: [],
    );
  }

  /// `Please select payment method`
  String get please_select_payment_method {
    return Intl.message(
      'Please select payment method',
      name: 'please_select_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get free {
    return Intl.message('Free', name: 'free', desc: '', args: []);
  }

  /// `Confirm Order`
  String get confirm_order_button {
    return Intl.message(
      'Confirm Order',
      name: 'confirm_order_button',
      desc: '',
      args: [],
    );
  }

  /// `Done Successfully`
  String get done_successfully {
    return Intl.message(
      'Done Successfully',
      name: 'done_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get order_number {
    return Intl.message(
      'Order Number',
      name: 'order_number',
      desc: '',
      args: [],
    );
  }

  /// `Track Order`
  String get track_order {
    return Intl.message('Track Order', name: 'track_order', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Good Morning`
  String get good_morning {
    return Intl.message(
      'Good Morning',
      name: 'good_morning',
      desc: '',
      args: [],
    );
  }

  /// `Best Selling`
  String get best_selling {
    return Intl.message(
      'Best Selling',
      name: 'best_selling',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `English`
  String get language {
    return Intl.message('English', name: 'language', desc: '', args: []);
  }

  /// `Language`
  String get language_text {
    return Intl.message('Language', name: 'language_text', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message('My Orders', name: 'my_orders', desc: '', args: []);
  }

  /// `Payments`
  String get payments {
    return Intl.message('Payments', name: 'payments', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `About Us`
  String get about_us {
    return Intl.message('About Us', name: 'about_us', desc: '', args: []);
  }

  /// `We are the designers of this application`
  String get about_us_description {
    return Intl.message(
      'We are the designers of this application',
      name: 'about_us_description',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personal_information {
    return Intl.message(
      'Personal Information',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password_hint {
    return Intl.message(
      'New Password',
      name: 'new_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirm_new_password_hint {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Already Added`
  String get already_added {
    return Intl.message(
      'Already Added',
      name: 'already_added',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Year`
  String get year {
    return Intl.message('Year', name: 'year', desc: '', args: []);
  }

  /// `Expiry Date`
  String get expiry_date {
    return Intl.message('Expiry Date', name: 'expiry_date', desc: '', args: []);
  }

  /// `Organic`
  String get organic {
    return Intl.message('Organic', name: 'organic', desc: '', args: []);
  }

  /// `Calories`
  String get calories {
    return Intl.message('Calories', name: 'calories', desc: '', args: []);
  }

  /// `per 100 grams`
  String get per_100_grams {
    return Intl.message(
      'per 100 grams',
      name: 'per_100_grams',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message('Rating', name: 'rating', desc: '', args: []);
  }

  /// `Review`
  String get review {
    return Intl.message('Review', name: 'review', desc: '', args: []);
  }

  /// `Add to Cart`
  String get add_to_cart {
    return Intl.message('Add to Cart', name: 'add_to_cart', desc: '', args: []);
  }

  /// `Go to Cart`
  String get go_to_cart {
    return Intl.message('Go to Cart', name: 'go_to_cart', desc: '', args: []);
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Write Comment`
  String get write_comment {
    return Intl.message(
      'Write Comment',
      name: 'write_comment',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message('Summary', name: 'summary', desc: '', args: []);
  }

  /// `Recommended`
  String get recommended {
    return Intl.message('Recommended', name: 'recommended', desc: '', args: []);
  }

  /// `Our Products`
  String get our_products {
    return Intl.message(
      'Our Products',
      name: 'our_products',
      desc: '',
      args: [],
    );
  }

  /// `No Comments`
  String get no_comments {
    return Intl.message('No Comments', name: 'no_comments', desc: '', args: []);
  }

  /// `No Results`
  String get no_results {
    return Intl.message('No Results', name: 'no_results', desc: '', args: []);
  }

  /// `Search for`
  String get search_for {
    return Intl.message('Search for', name: 'search_for', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Recent Searches`
  String get recent_searches {
    return Intl.message(
      'Recent Searches',
      name: 'recent_searches',
      desc: '',
      args: [],
    );
  }

  /// `Delete All`
  String get delete_all {
    return Intl.message('Delete All', name: 'delete_all', desc: '', args: []);
  }

  /// `Order Date`
  String get order_date {
    return Intl.message('Order Date', name: 'order_date', desc: '', args: []);
  }

  /// `Order Count`
  String get order_count {
    return Intl.message('Order Count', name: 'order_count', desc: '', args: []);
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Order Accepted`
  String get order_accepted {
    return Intl.message(
      'Order Accepted',
      name: 'order_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Order Shipped`
  String get order_shipped {
    return Intl.message(
      'Order Shipped',
      name: 'order_shipped',
      desc: '',
      args: [],
    );
  }

  /// `Out for Delivery`
  String get out_for_delivery {
    return Intl.message(
      'Out for Delivery',
      name: 'out_for_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Out for Delivery`
  String get out_for_delivery_text {
    return Intl.message(
      'Out for Delivery',
      name: 'out_for_delivery_text',
      desc: '',
      args: [],
    );
  }

  /// `Order Delivered`
  String get order_delivered {
    return Intl.message(
      'Order Delivered',
      name: 'order_delivered',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log out?`
  String get logout_confirmation {
    return Intl.message(
      'Do you want to log out?',
      name: 'logout_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `No, thanks`
  String get no_thanks {
    return Intl.message('No, thanks', name: 'no_thanks', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
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
