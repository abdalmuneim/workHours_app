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

  /// `الكلي ({all})   المتوفر ({avalible})   الغير متوفر ({notAvalile})`
  String counterEmployees(Object all, Object avalible, Object notAvalile) {
    return Intl.message(
      'الكلي ($all)   المتوفر ($avalible)   الغير متوفر ($notAvalile)',
      name: 'counterEmployees',
      desc: '',
      args: [all, avalible, notAvalile],
    );
  }

  /// `بحث`
  String get search {
    return Intl.message(
      'بحث',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `المجموعة`
  String get group {
    return Intl.message(
      'المجموعة',
      name: 'group',
      desc: '',
      args: [],
    );
  }

  /// `تصفية علي حسب المجموعة`
  String get filterByGroup {
    return Intl.message(
      'تصفية علي حسب المجموعة',
      name: 'filterByGroup',
      desc: '',
      args: [],
    );
  }

  /// `الكل`
  String get all {
    return Intl.message(
      'الكل',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `مجموعة أ`
  String get groupA {
    return Intl.message(
      'مجموعة أ',
      name: 'groupA',
      desc: '',
      args: [],
    );
  }

  /// `مجموعة ب`
  String get groupB {
    return Intl.message(
      'مجموعة ب',
      name: 'groupB',
      desc: '',
      args: [],
    );
  }

  /// `مجموعة ج`
  String get groupC {
    return Intl.message(
      'مجموعة ج',
      name: 'groupC',
      desc: '',
      args: [],
    );
  }

  /// `المتوفر`
  String get available {
    return Intl.message(
      'المتوفر',
      name: 'available',
      desc: '',
      args: [],
    );
  }

  /// `الغير متوفر`
  String get unavailable {
    return Intl.message(
      'الغير متوفر',
      name: 'unavailable',
      desc: '',
      args: [],
    );
  }

  /// `غير متوفر`
  String get unavailable_text {
    return Intl.message(
      'غير متوفر',
      name: 'unavailable_text',
      desc: '',
      args: [],
    );
  }

  /// `متوفر`
  String get available_text {
    return Intl.message(
      'متوفر',
      name: 'available_text',
      desc: '',
      args: [],
    );
  }

  /// `vacations`
  String get vacations {
    return Intl.message(
      'vacations',
      name: 'vacations',
      desc: '',
      args: [],
    );
  }

  /// ` من`
  String get from {
    return Intl.message(
      ' من',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// ` الى`
  String get to {
    return Intl.message(
      ' الى',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `انشاء قائمة`
  String get createList {
    return Intl.message(
      'انشاء قائمة',
      name: 'createList',
      desc: '',
      args: [],
    );
  }

  /// `اختر المجموعة`
  String get chosesGroup {
    return Intl.message(
      'اختر المجموعة',
      name: 'chosesGroup',
      desc: '',
      args: [],
    );
  }

  /// `من تاريخ`
  String get fromDate {
    return Intl.message(
      'من تاريخ',
      name: 'fromDate',
      desc: '',
      args: [],
    );
  }

  /// `اختر التاريخ`
  String get chosesDate {
    return Intl.message(
      'اختر التاريخ',
      name: 'chosesDate',
      desc: '',
      args: [],
    );
  }

  /// `الى تاريخ`
  String get toDate {
    return Intl.message(
      'الى تاريخ',
      name: 'toDate',
      desc: '',
      args: [],
    );
  }

  /// `ابدأ من رقم`
  String get startFromNum {
    return Intl.message(
      'ابدأ من رقم',
      name: 'startFromNum',
      desc: '',
      args: [],
    );
  }

  /// `ادخل الرقم (اختياري)`
  String get enterNumOptional {
    return Intl.message(
      'ادخل الرقم (اختياري)',
      name: 'enterNumOptional',
      desc: '',
      args: [],
    );
  }

  /// `عدد الساعات`
  String get numOfHours {
    return Intl.message(
      'عدد الساعات',
      name: 'numOfHours',
      desc: '',
      args: [],
    );
  }

  /// `ادخل عدد الساعات`
  String get enterNumOfHours {
    return Intl.message(
      'ادخل عدد الساعات',
      name: 'enterNumOfHours',
      desc: '',
      args: [],
    );
  }

  /// `ألغاء`
  String get cancel {
    return Intl.message(
      'ألغاء',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `مشاركة للواتساب`
  String get shareWhatsApp {
    return Intl.message(
      'مشاركة للواتساب',
      name: 'shareWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `حفظ القائمة`
  String get saveList {
    return Intl.message(
      'حفظ القائمة',
      name: 'saveList',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء ملف PDF`
  String get pDFGenerated {
    return Intl.message(
      'إنشاء ملف PDF',
      name: 'pDFGenerated',
      desc: '',
      args: [],
    );
  }

  /// `PDF file saved at: {path}`
  String pdfFileSavedAtPath(Object path) {
    return Intl.message(
      'PDF file saved at: $path',
      name: 'pdfFileSavedAtPath',
      desc: '',
      args: [path],
    );
  }

  /// `حدث خطاء ما`
  String get happendError {
    return Intl.message(
      'حدث خطاء ما',
      name: 'happendError',
      desc: '',
      args: [],
    );
  }

  /// `لقد شاركت الملف بنجاح`
  String get successShare {
    return Intl.message(
      'لقد شاركت الملف بنجاح',
      name: 'successShare',
      desc: '',
      args: [],
    );
  }

  /// `نسيت كلمة المرور`
  String get forgetPassword {
    return Intl.message(
      'نسيت كلمة المرور',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `التالي`
  String get next {
    return Intl.message(
      'التالي',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور الجديدة`
  String get newPassword {
    return Intl.message(
      'كلمة المرور الجديدة',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة المرور الجديدة`
  String get confirmNewPassword {
    return Intl.message(
      'تأكيد كلمة المرور الجديدة',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `تغيير كلمة المرور`
  String get changePassword {
    return Intl.message(
      'تغيير كلمة المرور',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `(اختياري)`
  String get optional {
    return Intl.message(
      '(اختياري)',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `اضافة مجموعة جديدة`
  String get addNewGroup {
    return Intl.message(
      'اضافة مجموعة جديدة',
      name: 'addNewGroup',
      desc: '',
      args: [],
    );
  }

  /// `ادخل الاسم`
  String get enterName {
    return Intl.message(
      'ادخل الاسم',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `اضافة موظف`
  String get addEmployee {
    return Intl.message(
      'اضافة موظف',
      name: 'addEmployee',
      desc: '',
      args: [],
    );
  }

  /// `اسم المجموعة`
  String get groupName {
    return Intl.message(
      'اسم المجموعة',
      name: 'groupName',
      desc: '',
      args: [],
    );
  }

  /// `اضافة مجموعة`
  String get addGroup {
    return Intl.message(
      'اضافة مجموعة',
      name: 'addGroup',
      desc: '',
      args: [],
    );
  }

  /// `إضافة`
  String get add {
    return Intl.message(
      'إضافة',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `تعديل موظف`
  String get editEmployee {
    return Intl.message(
      'تعديل موظف',
      name: 'editEmployee',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get profile {
    return Intl.message(
      'الملف الشخصي',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get logOut {
    return Intl.message(
      'تسجيل الخروج',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور الحالية`
  String get oldPassword {
    return Intl.message(
      'كلمة المرور الحالية',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `التاريخ`
  String get date {
    return Intl.message(
      'التاريخ',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `اليوم`
  String get day {
    return Intl.message(
      'اليوم',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get thePasswordProvidedIsTooWeak {
    return Intl.message(
      'The password provided is too weak.',
      name: 'thePasswordProvidedIsTooWeak',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get theAccountAlreadyExistsForThatEmail {
    return Intl.message(
      'The account already exists for that email.',
      name: 'theAccountAlreadyExistsForThatEmail',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is not correct`
  String get confirmPasswordIsNotCorrect {
    return Intl.message(
      'Confirm password is not correct',
      name: 'confirmPasswordIsNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a username`
  String get pleaseEnterAUsername {
    return Intl.message(
      'Please enter a username',
      name: 'pleaseEnterAUsername',
      desc: '',
      args: [],
    );
  }

  /// `Your Email has been verified Successful.`
  String get yourEmailHasBeenVerifiedSuccessful {
    return Intl.message(
      'Your Email has been verified Successful.',
      name: 'yourEmailHasBeenVerifiedSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Password Rest Email Sent.`
  String get passwordRestEmailSent {
    return Intl.message(
      'Password Rest Email Sent.',
      name: 'passwordRestEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد موظفين اضف موظف جديد!`
  String get noEmployeeYet {
    return Intl.message(
      'لا يوجد موظفين اضف موظف جديد!',
      name: 'noEmployeeYet',
      desc: '',
      args: [],
    );
  }

  /// `ادخل رقم الهاتف`
  String get enterPhone {
    return Intl.message(
      'ادخل رقم الهاتف',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `أدخل سم المجموعة`
  String get enterGroupName {
    return Intl.message(
      'أدخل سم المجموعة',
      name: 'enterGroupName',
      desc: '',
      args: [],
    );
  }

  /// `تاكد من ادخال الاسم ورقم الهاتف`
  String get validateNameAndPhone {
    return Intl.message(
      'تاكد من ادخال الاسم ورقم الهاتف',
      name: 'validatNameAndPhone',
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
