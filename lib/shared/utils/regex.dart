class Regex {
  static bool isEmail(String email) {
    RegExp regExp = RegExp(r'\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*');
    return regExp.hasMatch(email);
  }

  static String transformPhoneNumber(String number) {
    RegExp phoneNumberRegex = RegExp(r'^(\+?91)?(?:\+)?0*(\d{10})$');
    var match = phoneNumberRegex.firstMatch(number);
    return match?.group(2) ?? number;
  }
}
