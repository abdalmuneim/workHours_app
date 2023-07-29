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

  static String m0(member) => "${member} موجود بالفعل";

  static String m1(email) =>
      "لقد ارسلنا اليك رابط على بريدك الالكتروني${email} برجاء الضغط على الرابط ليتم اعادة توجيهك الي التطبيق ";

  static String m2(name) => "!${name} اهلا بك يا";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addNewEmployee":
            MessageLookupByLibrary.simpleMessage("اضافة موظف جديد"),
        "addedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم الاضافة بنجاح"),
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("لديك حساب بالفعل؟"),
        "checkAllFields":
            MessageLookupByLibrary.simpleMessage("تحقق من جميع العقول"),
        "checkUEmail":
            MessageLookupByLibrary.simpleMessage("تفقد بريدك الالكتروني"),
        "checkUEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "تحقق من الايميل او كلمة المرور"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("تاكيد الرقم السري"),
        "continuo": MessageLookupByLibrary.simpleMessage("استمرار"),
        "createAccount": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
        "createdAccountSuccess":
            MessageLookupByLibrary.simpleMessage("تم انشاء الحساب بنجاح"),
        "delete": MessageLookupByLibrary.simpleMessage("حذف"),
        "doUForgetPassword":
            MessageLookupByLibrary.simpleMessage("هل نسيت كلمه المرور؟"),
        "email": MessageLookupByLibrary.simpleMessage("البريد الالكتروني"),
        "enterEmail":
            MessageLookupByLibrary.simpleMessage("اخل البريد الالكتروني"),
        "enterFirstName":
            MessageLookupByLibrary.simpleMessage("ادخل الاسم الاول"),
        "enterLastName":
            MessageLookupByLibrary.simpleMessage("اخل الاسم الاخير"),
        "enterPassword":
            MessageLookupByLibrary.simpleMessage("ادخل كلمة المرور"),
        "enterValidateEmail": MessageLookupByLibrary.simpleMessage(
            "برجاء إدخال بريد إلكتروني صحيح"),
        "enterValidateName":
            MessageLookupByLibrary.simpleMessage("برجاء إدخال اسم صحيح"),
        "enterValidatePassword": MessageLookupByLibrary.simpleMessage(
            "كلمة السر يجب ان تحتوي علي 6 حروف او 6 ارقام علي الاقل"),
        "firstName": MessageLookupByLibrary.simpleMessage("الاسم الاول"),
        "haveAccount": MessageLookupByLibrary.simpleMessage("لدي حساب بالفعل"),
        "homePage": MessageLookupByLibrary.simpleMessage("الصفحة الرئيسية"),
        "lastName": MessageLookupByLibrary.simpleMessage("الاسم الاخير"),
        "memberIsAlreadyExists": m0,
        "menuOfEmployees":
            MessageLookupByLibrary.simpleMessage("قائمة الموظفين"),
        "name": MessageLookupByLibrary.simpleMessage("الاسم الثلاثي"),
        "nationalID":
            MessageLookupByLibrary.simpleMessage("رقم الهوية الوطنية"),
        "noInternetConnection": MessageLookupByLibrary.simpleMessage(
            "لا يوجد اتصال بالانترنت تحقق من تفعيله"),
        "notHaveAccount":
            MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
        "otpCodeSent": MessageLookupByLibrary.simpleMessage(
            "تم ارسال رمز التحقق انظر الرسائل"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("كلمه المرور غير مطابقه"),
        "phone": MessageLookupByLibrary.simpleMessage("الهاتف"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("رقم الجوال"),
        "pressAgainToExit":
            MessageLookupByLibrary.simpleMessage("اضغط مجددا للخروج"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("هذا الحقل مطلوب"),
        "resendOTP": MessageLookupByLibrary.simpleMessage("أعد الارسال"),
        "resendOTPAfter":
            MessageLookupByLibrary.simpleMessage("أعد الارسال خلال"),
        "resentLink": MessageLookupByLibrary.simpleMessage("اعادة ارسال الرمز"),
        "save": MessageLookupByLibrary.simpleMessage("حفظ"),
        "sendValidateCode":
            MessageLookupByLibrary.simpleMessage("ارسل رمز التحقق"),
        "signIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "start": MessageLookupByLibrary.simpleMessage("البداية"),
        "validName": MessageLookupByLibrary.simpleMessage("الاسم مطلوب"),
        "validPhone": MessageLookupByLibrary.simpleMessage("رقم الجوال مطلوب"),
        "validateCodeNumber":
            MessageLookupByLibrary.simpleMessage("رقم التحقق خطاء"),
        "verification": MessageLookupByLibrary.simpleMessage("تحقق"),
        "verificationCode": MessageLookupByLibrary.simpleMessage("رمز التحقق"),
        "weSendEmailForVerifyUEmail": m1,
        "welcome": MessageLookupByLibrary.simpleMessage("اهلا"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("مرحبا بعودتك"),
        "welcomeO": m2
      };
}
