class AppValidators {
  static bool validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }

    // Твоя регулярка из RegisterScreen
    final emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    return emailRegex.hasMatch(email);
  }
}
