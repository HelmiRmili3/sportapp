class Validators {
  // Email Validator
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password Validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasNumber = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacter =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase || !hasLowercase || !hasNumber || !hasSpecialCharacter) {
      return 'Password must contain uppercase, lowercase, numbers, and special characters';
    }
    return null;
  }

  // Number Validator
  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Number cannot be empty';
    }
    if (value.length != 10) {
      return 'Number must be exactly 10 digits long';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Number must only contain digits';
    }
    return null;
  }
}
