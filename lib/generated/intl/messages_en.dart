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

  static String m0(all, avalible, notAvalile) =>
      "الكل (${all})   المتوفر (${avalible})   الغير متوفر (${notAvalile})";

  static String m1(member) => "${member} موجود بالفعل";

  static String m2(path) => "PDF file saved at: ${path}";

  static String m3(email) =>
      "لقد ارسلنا اليك رابط على بريدك الالكتروني${email} برجاء الضغط على الرابط ليتم اعادة توجيهك الي التطبيق ";

  static String m4(name) => "!${name} اهلا بك يا";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("إضافة"),
        "addEmployee": MessageLookupByLibrary.simpleMessage("اضافة موظف"),
        "addGroup": MessageLookupByLibrary.simpleMessage("اضافة مجموعة"),
        "addNewEmployee":
            MessageLookupByLibrary.simpleMessage("اضافة موظف جديد"),
        "addNewGroup":
            MessageLookupByLibrary.simpleMessage("اضافة مجموعة جديدة"),
        "addedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم الاضافة بنجاح"),
        "all": MessageLookupByLibrary.simpleMessage("الكل"),
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("لديك حساب بالفعل؟"),
        "available": MessageLookupByLibrary.simpleMessage("المتوفر"),
        "available_text": MessageLookupByLibrary.simpleMessage("متوفر"),
        "cancel": MessageLookupByLibrary.simpleMessage("ألغاء"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
        "changedPasswordSuccess":
            MessageLookupByLibrary.simpleMessage("تم تغير كلمه السر بنجاح"),
        "checkAllFields":
            MessageLookupByLibrary.simpleMessage("تحقق من جميع العقول"),
        "checkUEmail":
            MessageLookupByLibrary.simpleMessage("تفقد بريدك الالكتروني"),
        "checkUEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "تحقق من الايميل او كلمة المرور"),
        "chosesDate": MessageLookupByLibrary.simpleMessage("اختر التاريخ"),
        "chosesGroup": MessageLookupByLibrary.simpleMessage("اختر المجموعة"),
        "chosessGroup": MessageLookupByLibrary.simpleMessage("اختر مجموعة"),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور الجديدة"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("تاكيد الرقم السري"),
        "confirmPasswordIsNotCorrect": MessageLookupByLibrary.simpleMessage(
            "Confirm password is not correct"),
        "connectingWithUs": MessageLookupByLibrary.simpleMessage("تواصل معنا"),
        "continuo": MessageLookupByLibrary.simpleMessage("استمرار"),
        "counterEmployees": m0,
        "createAccount": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
        "createList": MessageLookupByLibrary.simpleMessage("انشاء قائمة"),
        "createdAccountSuccess":
            MessageLookupByLibrary.simpleMessage("تم انشاء الحساب بنجاح"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("كلمه المرور احاليه"),
        "date": MessageLookupByLibrary.simpleMessage("التاريخ"),
        "day": MessageLookupByLibrary.simpleMessage("اليوم"),
        "delete": MessageLookupByLibrary.simpleMessage("حذف"),
        "doUForgetPassword":
            MessageLookupByLibrary.simpleMessage("هل نسيت كلمه المرور؟"),
        "editEmployee": MessageLookupByLibrary.simpleMessage("تعديل موظف"),
        "email": MessageLookupByLibrary.simpleMessage("البريد الالكتروني"),
        "emptyList": MessageLookupByLibrary.simpleMessage("القائمة فارغة"),
        "enterEmail":
            MessageLookupByLibrary.simpleMessage("اخل البريد الالكتروني"),
        "enterFirstName":
            MessageLookupByLibrary.simpleMessage("ادخل الاسم الاول"),
        "enterGroupName":
            MessageLookupByLibrary.simpleMessage("أدخل سم المجموعة"),
        "enterLastName":
            MessageLookupByLibrary.simpleMessage("اخل الاسم الاخير"),
        "enterName": MessageLookupByLibrary.simpleMessage("ادخل الاسم"),
        "enterNumOfHours":
            MessageLookupByLibrary.simpleMessage("ادخل عدد الساعات"),
        "enterNumOptional":
            MessageLookupByLibrary.simpleMessage("ادخل الرقم (اختياري)"),
        "enterPassword":
            MessageLookupByLibrary.simpleMessage("ادخل كلمة المرور"),
        "enterPhone": MessageLookupByLibrary.simpleMessage("ادخل رقم الهاتف"),
        "enterValidateEmail": MessageLookupByLibrary.simpleMessage(
            "برجاء إدخال بريد إلكتروني صحيح"),
        "enterValidateName":
            MessageLookupByLibrary.simpleMessage("برجاء إدخال اسم صحيح"),
        "enterValidatePassword": MessageLookupByLibrary.simpleMessage(
            "كلمة السر يجب ان تحتوي علي 6 حروف او 6 ارقام علي الاقل"),
        "filterByGroup":
            MessageLookupByLibrary.simpleMessage("تصفية علي حسب المجموعة"),
        "firstName": MessageLookupByLibrary.simpleMessage("الاسم الاول"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور"),
        "from": MessageLookupByLibrary.simpleMessage(" من"),
        "fromDate": MessageLookupByLibrary.simpleMessage("من تاريخ"),
        "group": MessageLookupByLibrary.simpleMessage("المجموعة"),
        "groupA": MessageLookupByLibrary.simpleMessage("مجموعة أ"),
        "groupB": MessageLookupByLibrary.simpleMessage("مجموعة ب"),
        "groupC": MessageLookupByLibrary.simpleMessage("مجموعة ج"),
        "groupName": MessageLookupByLibrary.simpleMessage("اسم المجموعة"),
        "happendError": MessageLookupByLibrary.simpleMessage("حدث خطاء ما"),
        "haveAccount": MessageLookupByLibrary.simpleMessage("لدي حساب بالفعل"),
        "homePage": MessageLookupByLibrary.simpleMessage("الصفحة الرئيسية"),
        "lastName": MessageLookupByLibrary.simpleMessage("الاسم الاخير"),
        "logOut": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "memberIsAlreadyExists": m1,
        "menuOfEmployees":
            MessageLookupByLibrary.simpleMessage("قائمة الموظفين"),
        "name": MessageLookupByLibrary.simpleMessage("الاسم الثلاثي"),
        "nationalID":
            MessageLookupByLibrary.simpleMessage("رقم الهوية الوطنية"),
        "newPassword":
            MessageLookupByLibrary.simpleMessage("كلمة المرور الجديدة"),
        "next": MessageLookupByLibrary.simpleMessage("التالي"),
        "noEmployeeYet": MessageLookupByLibrary.simpleMessage(
            "لا يوجد موظفين اضف موظف جديد!"),
        "noInternetConnection": MessageLookupByLibrary.simpleMessage(
            "لا يوجد اتصال بالانترنت تحقق من تفعيله"),
        "notHaveAccount":
            MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
        "numOfHours": MessageLookupByLibrary.simpleMessage("عدد الساعات"),
        "oldPassword":
            MessageLookupByLibrary.simpleMessage("كلمة المرور الحالية"),
        "optional": MessageLookupByLibrary.simpleMessage("(اختياري)"),
        "otpCodeSent": MessageLookupByLibrary.simpleMessage(
            "تم ارسال رمز التحقق انظر الرسائل"),
        "pDFGenerated": MessageLookupByLibrary.simpleMessage("إنشاء ملف PDF"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "passwordRestEmailSent":
            MessageLookupByLibrary.simpleMessage("Password Rest Email Sent."),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("كلمه المرور غير مطابقه"),
        "pdfFileSavedAtPath": m2,
        "phone": MessageLookupByLibrary.simpleMessage("الهاتف"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("رقم الجوال"),
        "pleaseEnterAUsername":
            MessageLookupByLibrary.simpleMessage("Please enter a username"),
        "plzAddEmployee":
            MessageLookupByLibrary.simpleMessage("برجاء اضافة موظفين"),
        "pressAgainToExit":
            MessageLookupByLibrary.simpleMessage("اضغط مجددا للخروج"),
        "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("هذا الحقل مطلوب"),
        "resendOTP": MessageLookupByLibrary.simpleMessage("أعد الارسال"),
        "resendOTPAfter":
            MessageLookupByLibrary.simpleMessage("أعد الارسال خلال"),
        "resentLink": MessageLookupByLibrary.simpleMessage("اعادة ارسال الرمز"),
        "save": MessageLookupByLibrary.simpleMessage("حفظ"),
        "saveList": MessageLookupByLibrary.simpleMessage("حفظ القائمة"),
        "search": MessageLookupByLibrary.simpleMessage("بحث"),
        "sendValidateCode":
            MessageLookupByLibrary.simpleMessage("ارسل رمز التحقق"),
        "shareWhatsApp":
            MessageLookupByLibrary.simpleMessage("مشاركة للواتساب"),
        "signIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "start": MessageLookupByLibrary.simpleMessage("البداية"),
        "startFromNum": MessageLookupByLibrary.simpleMessage("ابدأ من رقم"),
        "successShare":
            MessageLookupByLibrary.simpleMessage("لقد شاركت الملف بنجاح"),
        "theAccountAlreadyExistsForThatEmail":
            MessageLookupByLibrary.simpleMessage(
                "The account already exists for that email."),
        "thePasswordProvidedIsTooWeak": MessageLookupByLibrary.simpleMessage(
            "The password provided is too weak."),
        "to": MessageLookupByLibrary.simpleMessage(" الى"),
        "toDate": MessageLookupByLibrary.simpleMessage("الى تاريخ"),
        "unavailable": MessageLookupByLibrary.simpleMessage("الغير متوفر"),
        "unavailable_text": MessageLookupByLibrary.simpleMessage("غير متوفر"),
        "updataSuccess":
            MessageLookupByLibrary.simpleMessage("تم التحديث بنجاح"),
        "vacations": MessageLookupByLibrary.simpleMessage("vacations"),
        "validName": MessageLookupByLibrary.simpleMessage("الاسم مطلوب"),
        "validPhone": MessageLookupByLibrary.simpleMessage("رقم الجوال مطلوب"),
        "validateCodeNumber":
            MessageLookupByLibrary.simpleMessage("رقم التحقق خطاء"),
        "validateNameAndPhone": MessageLookupByLibrary.simpleMessage(
            "تاكد من ادخال الاسم ورقم الهاتف"),
        "verification": MessageLookupByLibrary.simpleMessage("تحقق"),
        "verificationCode": MessageLookupByLibrary.simpleMessage("رمز التحقق"),
        "weSendEmailForVerifyUEmail": m3,
        "welcome": MessageLookupByLibrary.simpleMessage("اهلا"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("مرحبا بعودتك"),
        "welcomeO": m4,
        "yourEmailHasBeenVerifiedSuccessful":
            MessageLookupByLibrary.simpleMessage(
                "Your Email has been verified Successful.")
      };
}
