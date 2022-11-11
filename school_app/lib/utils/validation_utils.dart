class ValidationMSG {
  // Email
  static const String kEmailIsEmpty = 'Please enter your email address.';
  static const String kInvalidEmail = 'Please enter valid email address.';

  // Mobile
  static const String kPhoneNumberIsEmpty = 'Please enter your phone number.';
  static const String kInvalidMobile = 'Please enter valid phone number.';

  // Password
  static const String kPasswordIsEmpty = 'Password is required.';
  static const String kPasswordLengthValidation =
      'Please enter password at least 6 characters.';
  static const String kPasswordNotMatching = 'Passwords are not matching.';
  static const String kConfirmPasswordIsEmpty = 'Confirm password is required.';

  // Full Name
  static const String kFullNameIsEmpty = 'Please enter your full name.';
  static const String kFullNameLengthValidation =
      // ignore: lines_longer_than_80_chars
      'Please enter full name at least 3 characters.';
}

class ValidationUtils {
  static String? validatePassword(
    String value, {
    bool isPasswordNotMatching = false,
  }) {
    final String password = value.trim();
    if (password.isEmpty) {
      return ValidationMSG.kPasswordIsEmpty;
    } else if (password.length < 6) {
      return ValidationMSG.kPasswordLengthValidation;
    } else if (isPasswordNotMatching) {
      return ValidationMSG.kPasswordNotMatching;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String value, {
    bool isPasswordNotMatching = false,
  }) {
    final String password = value.trim();
    if (isPasswordNotMatching) {
      return ValidationMSG.kPasswordNotMatching;
    } else if (password.isEmpty) {
      return ValidationMSG.kConfirmPasswordIsEmpty;
    }
    return null;
  }

  static String? validateName(String? value) {
    final String name = value?.trim() ?? '';
    if (name.isEmpty) {
      return ValidationMSG.kFullNameIsEmpty;
    } else if (name.length <= 3) {
      return ValidationMSG.kFullNameLengthValidation;
    }
    return null;
  }

  static String? validateEmail(String? value, bool isEmailRequired) {
    const String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final RegExp regExp = RegExp(pattern);
    final String email = value?.trim() ?? '';
    if (email.isEmpty) {
      return isEmailRequired ? ValidationMSG.kEmailIsEmpty : null;
    } else if (!regExp.hasMatch(email)) {
      return ValidationMSG.kInvalidEmail;
    } else {
      return null;
    }
  }

  static String? validateMobile(String? value) {
    const String pattern = r'(^[0-9]{10}$)';
    final RegExp regExp = RegExp(pattern);
    final String phoneNumber = value?.trim().replaceAll(' ', '') ?? '';
    if (phoneNumber.isEmpty) {
      return ValidationMSG.kPhoneNumberIsEmpty;
    } else if (phoneNumber.length > 10) {
      return ValidationMSG.kInvalidMobile;
    } else if (!regExp.hasMatch(phoneNumber)) {
      return ValidationMSG.kInvalidMobile;
    }
    return null;
  }
}
