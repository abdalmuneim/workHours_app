class AppConstants {
  static String get email => "alma.lawson@example.com";
  static String get phone => "(239) 555-0108";
  static String get location => "29 شارع الزهور, ميدان رمسيس, القاهره, مصر.";

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: 'en.png',
        languageName: "English",
        countryCode: "US",
        languageCode: "en"),
    LanguageModel(
        imageUrl: 'ar.png',
        languageName: "العربية",
        countryCode: "eg",
        languageCode: "ar"),
  ];

  static int timeOut = 120;
  static String countryCode = "+966"; // TODO:change to +966

  static int phoneLength = 10; // TODO: change to 9
  static int codeLength = 6;
}

class LanguageModel {
  final String imageUrl;
  final String languageName;
  final String countryCode;
  final String languageCode;

  LanguageModel({
    required this.imageUrl,
    required this.languageName,
    required this.countryCode,
    required this.languageCode,
  });
}
