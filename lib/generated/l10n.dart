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

  /// `رقم الجوال مطلوب`
  String get validPhone {
    return Intl.message(
      'رقم الجوال مطلوب',
      name: 'validPhone',
      desc: '',
      args: [],
    );
  }

  /// `الاسم مطلوب`
  String get validName {
    return Intl.message(
      'الاسم مطلوب',
      name: 'validName',
      desc: '',
      args: [],
    );
  }

  /// `البداية`
  String get start {
    return Intl.message(
      'البداية',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `رقم الجوال`
  String get phoneNumber {
    return Intl.message(
      'رقم الجوال',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `ارسل رمز التحقق`
  String get sendValidateCode {
    return Intl.message(
      'ارسل رمز التحقق',
      name: 'sendValidateCode',
      desc: '',
      args: [],
    );
  }

  /// `رقم التحقق خطاء`
  String get validateCodeNumber {
    return Intl.message(
      'رقم التحقق خطاء',
      name: 'validateCodeNumber',
      desc: '',
      args: [],
    );
  }

  /// `رمز التحقق`
  String get verificationCode {
    return Intl.message(
      'رمز التحقق',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `تحقق`
  String get verification {
    return Intl.message(
      'تحقق',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `هذا الحقل مطلوب`
  String get requiredField {
    return Intl.message(
      'هذا الحقل مطلوب',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الثلاثي`
  String get name {
    return Intl.message(
      'الاسم الثلاثي',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `رقم الهوية الوطنية`
  String get nationalID {
    return Intl.message(
      'رقم الهوية الوطنية',
      name: 'nationalID',
      desc: '',
      args: [],
    );
  }

  /// `استمرار`
  String get continuo {
    return Intl.message(
      'استمرار',
      name: 'continuo',
      desc: '',
      args: [],
    );
  }

  /// `تحقق من جميع العقول`
  String get checkAllFields {
    return Intl.message(
      'تحقق من جميع العقول',
      name: 'checkAllFields',
      desc: '',
      args: [],
    );
  }

  /// `اهلا`
  String get welcome {
    return Intl.message(
      'اهلا',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `{member} موجود بالفعل`
  String memberIsAlreadyExists(Object member) {
    return Intl.message(
      '$member موجود بالفعل',
      name: 'memberIsAlreadyExists',
      desc: '',
      args: [member],
    );
  }

  /// `حفظ`
  String get save {
    return Intl.message(
      'حفظ',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `حذف`
  String get delete {
    return Intl.message(
      'حذف',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `الصفحة الرئيسية`
  String get homePage {
    return Intl.message(
      'الصفحة الرئيسية',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `تم الاضافة بنجاح`
  String get addedSuccessfully {
    return Intl.message(
      'تم الاضافة بنجاح',
      name: 'addedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `تم ارسال رمز التحقق انظر الرسائل`
  String get otpCodeSent {
    return Intl.message(
      'تم ارسال رمز التحقق انظر الرسائل',
      name: 'otpCodeSent',
      desc: '',
      args: [],
    );
  }

  /// `تم انشاء الحساب بنجاح`
  String get createdAccountSuccess {
    return Intl.message(
      'تم انشاء الحساب بنجاح',
      name: 'createdAccountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `مرحبا بعودتك`
  String get welcomeBack {
    return Intl.message(
      'مرحبا بعودتك',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد اتصال بالانترنت تحقق من تفعيله`
  String get noInternetConnection {
    return Intl.message(
      'لا يوجد اتصال بالانترنت تحقق من تفعيله',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `أعد الارسال`
  String get resendOTP {
    return Intl.message(
      'أعد الارسال',
      name: 'resendOTP',
      desc: '',
      args: [],
    );
  }

  /// `أعد الارسال خلال`
  String get resendOTPAfter {
    return Intl.message(
      'أعد الارسال خلال',
      name: 'resendOTPAfter',
      desc: '',
      args: [],
    );
  }

  /// `الهاتف`
  String get phone {
    return Intl.message(
      'الهاتف',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `اضغط مجددا للخروج`
  String get pressAgainToExit {
    return Intl.message(
      'اضغط مجددا للخروج',
      name: 'pressAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get signIn {
    return Intl.message(
      'تسجيل الدخول',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `البريد الالكتروني`
  String get email {
    return Intl.message(
      'البريد الالكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `اخل البريد الالكتروني`
  String get enterEmail {
    return Intl.message(
      'اخل البريد الالكتروني',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `ادخل كلمة المرور`
  String get enterPassword {
    return Intl.message(
      'ادخل كلمة المرور',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `هل نسيت كلمه المرور؟`
  String get doUForgetPassword {
    return Intl.message(
      'هل نسيت كلمه المرور؟',
      name: 'doUForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `لديك حساب بالفعل؟`
  String get alreadyHaveAccount {
    return Intl.message(
      'لديك حساب بالفعل؟',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب؟`
  String get notHaveAccount {
    return Intl.message(
      'ليس لديك حساب؟',
      name: 'notHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب`
  String get createAccount {
    return Intl.message(
      'إنشاء حساب',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `تحقق من الايميل او كلمة المرور`
  String get checkUEmailOrPassword {
    return Intl.message(
      'تحقق من الايميل او كلمة المرور',
      name: 'checkUEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الاول`
  String get firstName {
    return Intl.message(
      'الاسم الاول',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الاخير`
  String get lastName {
    return Intl.message(
      'الاسم الاخير',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `اخل الاسم الاخير`
  String get enterLastName {
    return Intl.message(
      'اخل الاسم الاخير',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `ادخل الاسم الاول`
  String get enterFirstName {
    return Intl.message(
      'ادخل الاسم الاول',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `تاكيد الرقم السري`
  String get confirmPassword {
    return Intl.message(
      'تاكيد الرقم السري',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `لدي حساب بالفعل`
  String get haveAccount {
    return Intl.message(
      'لدي حساب بالفعل',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `برجاء إدخال بريد إلكتروني صحيح`
  String get enterValidateEmail {
    return Intl.message(
      'برجاء إدخال بريد إلكتروني صحيح',
      name: 'enterValidateEmail',
      desc: '',
      args: [],
    );
  }

  /// `كلمة السر يجب ان تحتوي علي 6 حروف او 6 ارقام علي الاقل`
  String get enterValidatePassword {
    return Intl.message(
      'كلمة السر يجب ان تحتوي علي 6 حروف او 6 ارقام علي الاقل',
      name: 'enterValidatePassword',
      desc: '',
      args: [],
    );
  }

  /// `برجاء إدخال اسم صحيح`
  String get enterValidateName {
    return Intl.message(
      'برجاء إدخال اسم صحيح',
      name: 'enterValidateName',
      desc: '',
      args: [],
    );
  }

  /// `كلمه المرور غير مطابقه`
  String get passwordsDoNotMatch {
    return Intl.message(
      'كلمه المرور غير مطابقه',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `!{name} اهلا بك يا`
  String welcomeO(Object name) {
    return Intl.message(
      '!$name اهلا بك يا',
      name: 'welcomeO',
      desc: '',
      args: [name],
    );
  }

  /// `تفقد بريدك الالكتروني`
  String get checkUEmail {
    return Intl.message(
      'تفقد بريدك الالكتروني',
      name: 'checkUEmail',
      desc: '',
      args: [],
    );
  }

  /// `لقد ارسلنا اليك رابط على بريدك الالكتروني{email} برجاء الضغط على الرابط ليتم اعادة توجيهك الي التطبيق `
  String weSendEmailForVerifyUEmail(Object email) {
    return Intl.message(
      'لقد ارسلنا اليك رابط على بريدك الالكتروني$email برجاء الضغط على الرابط ليتم اعادة توجيهك الي التطبيق ',
      name: 'weSendEmailForVerifyUEmail',
      desc: '',
      args: [email],
    );
  }

  /// `اعادة ارسال الرمز`
  String get resentLink {
    return Intl.message(
      'اعادة ارسال الرمز',
      name: 'resentLink',
      desc: '',
      args: [],
    );
  }

  /// `قائمة الموظفين`
  String get menuOfEmployees {
    return Intl.message(
      'قائمة الموظفين',
      name: 'menuOfEmployees',
      desc: '',
      args: [],
    );
  }

  /// `اضافة موظف جديد`
  String get addNewEmployee {
    return Intl.message(
      'اضافة موظف جديد',
      name: 'addNewEmployee',
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