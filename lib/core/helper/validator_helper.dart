class ValidateHelper {
  ValidateHelper._();

  static final RegExp _emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static String? validateEmail(String? input) {
    final _hasMatched = ((input != null) && _emailRegex.hasMatch(input));

    if (_hasMatched) {
      return null;
    } else {
      return 'Invalid Email';
    }
  }

  static String? validateEmptyPassword(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Please enter password';
    } else {
      return null;
    }
  }

  static String? validateEmptyText(String? input) {
    if (input == null || input.trim().isEmpty) {
      return 'Please enter Something';
    } else {
      return null;
    }
  }
}
