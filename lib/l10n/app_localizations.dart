// lib/l10n/app_localizations.dart
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  // Common
  String get appName => 'LocalMarket';
  String get home => 'Home';
  String get categories => 'Categories';
  String get cart => 'Cart';
  String get orders => 'Orders';
  String get profile => 'Profile';
  String get search => 'Search';
  String get loading => 'Loading...';
  String get error => 'Error';
  String get retry => 'Retry';
  String get cancel => 'Cancel';
  String get confirm => 'Confirm';
  String get save => 'Save';
  String get delete => 'Delete';
  String get edit => 'Edit';
  String get add => 'Add';
  String get remove => 'Remove';
  String get continueText => 'Continue';
  String get back => 'Back';
  String get next => 'Next';
  String get done => 'Done';
  String get ok => 'OK';
  String get yes => 'Yes';
  String get no => 'No';
  String get and => 'and';
  String get or => 'or';
  String get optional => 'Optional';
  String get required => 'Required';
  String get seeAll => 'See All';
  String get searchProducts => 'Search products...';
  String get addToCart => 'Add to Cart';
  String get buyNow => 'Buy Now';
  String get user => 'User';
  String get goodMorning => 'Good Morning';
  String get featuredStores => 'Featured Stores';
  String get featuredProducts => 'Featured Products';

  // Authentication
  String get welcomeToLocalMarket => 'Welcome to LocalMarket';
  String get yourLocalMarketplace => 'Your Local Marketplace';
  String get enterPhoneNumberToGetStarted => 'Enter your phone number to get started';
  String get phoneNumber => 'Phone Number';
  String get enterPhoneNumber => 'Enter phone number';
  String get phoneNumberRequired => 'Phone number is required';
  String get validPhoneNumberRequired => 'Please enter a valid phone number';
  String get continueWithPhone => 'Continue with Phone';
  String get continueWithEmail => 'Continue with Email';
  String get orContinueWith => 'or continue with';
  String get verifyPhoneNumber => 'Verify Phone Number';
  String get enterCodeSentTo => 'Enter the code sent to';
  String get verify => 'Verify';
  String get resendCode => 'Resend Code';
  String resendCodeIn(int seconds) => 'Resend code in ${seconds}s';
  String get otpSentSuccessfully => 'OTP sent successfully';
  String get completeYourProfile => 'Complete Your Profile';
  String get helpUsKnowYouBetter => 'Help us know you better';
  String get fullName => 'Full Name';
  String get enterYourFullName => 'Enter your full name';
  String get fullNameRequired => 'Full name is required';
  String get email => 'Email';
  String get enterYourEmail => 'Enter your email';
  String get emailRequired => 'Email is required';
  String get validEmailRequired => 'Please enter a valid email';
  String get iAmA => 'I am a';
  String get customer => 'Customer';
  String get buyProducts => 'Buy products';
  String get seller => 'Seller';
  String get sellProducts => 'Sell products';
  String get byContinuingYouAgree => 'By continuing, you agree to our ';
  String get termsOfService => 'Terms of Service';
  String get privacyPolicy => 'Privacy Policy';
  String get welcomeBack => 'Welcome Back';
  String get signInToYourAccount => 'Sign in to your account';
  String get signIn => 'Sign In';
  String get signUp => 'Sign Up';
  String get password => 'Password';
  String get enterYourPassword => 'Enter your password';
  String get passwordRequired => 'Password is required';
  String get confirmPassword => 'Confirm Password';
  String get confirmYourPassword => 'Confirm your password';
  String get confirmPasswordRequired => 'Please confirm your password';
  String get passwordsDoNotMatch => 'Passwords do not match';
  String get passwordTooShort => 'Password must be at least 6 characters';
  String get forgotPassword => 'Forgot Password?';
  String get createAccount => 'Create Account';
  String get signUpToGetStarted => 'Sign up to get started';
  String get bySigningUpYouAgree => 'By signing up, you agree to our ';
  String get orSignInWith => 'or sign in with';
  String get orSignUpWith => 'or sign up with';
  String get enterEmailToResetPassword => 'Enter your email to reset your password';
  String get sendResetEmail => 'Send Reset Email';
  String get backToSignIn => 'Back to Sign In';
  String get emailSent => 'Email Sent!';
  String passwordResetEmailSent(String email) => 'Password reset email sent to $email';
  String get openEmailApp => 'Open Email App';
  String get resendEmail => 'Resend Email';
  String get verifyYourEmail => 'Verify Your Email';
  String get verificationEmailSentDescription => 'We\'ve sent a verification email to your address. Please check your email and click the verification link.';
  String get resendVerificationEmail => 'Resend Verification Email';
  String get verificationEmailSent => 'Verification email sent!';
  String get useAnotherEmail => 'Use Another Email';

  // Home
  String get justForYou => 'Just for You';
  String get trendingNow => 'Trending Now';
  String get recentlyViewed => 'Recently Viewed';

  // Products
  String get outOfStock => 'Out of Stock';
  String get inStock => 'In Stock';
  String get limitedStock => 'Limited Stock';

  // General Messages
  String get somethingWentWrong => 'Something went wrong';
  String get noInternetConnection => 'No internet connection';
  String get tryAgain => 'Try Again';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'si'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
