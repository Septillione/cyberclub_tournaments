class AppValidators {
  static bool validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegex.hasMatch(email);
  }

  static bool validatePassword(String? password) {
    if (password == null || password.isEmpty) return false;
    return password.length >= 6;
  }

  static bool validateNickname(String? nickname) {
    if (nickname == null || nickname.isEmpty) return false;
    return nickname.length >= 3;
  }
}
