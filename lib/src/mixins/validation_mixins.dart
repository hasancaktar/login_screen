class ValidateMixin {
  String validateEmail(String value) {
    if (!value.contains("@")) {
      return "lütfen geçerli bir maii adresi gir";
    }
   return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return "lütfen en az beş karakter girin";
    }
    return null;
  }
}
