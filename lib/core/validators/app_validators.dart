class Validators {
  Validators._();

  static final RegExp _emailRegex = RegExp(
    r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$',
  );

  static final RegExp _passwordStrengthRegex = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d).{8,}$',
  );

  static final RegExp _phoneRegex = RegExp(
    r'^\+?[0-9]{8,15}$',
  );

  static String? required(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? emailNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return null;
    if (!_emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? passwordNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  static String? passwordStrength(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!_passwordStrengthRegex.hasMatch(value)) {
      return 'Password must be 8+ characters and include a letter and a number';
    }
    return null;
  }

  static String? Function(String?) confirms(String? original) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'Please confirm your password';
      }
      if (value != original) {
        return 'Passwords do not match';
      }
      return null;
    };
  }

  static String? fullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 2) {
      return 'Name is too short';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    if (!_phoneRegex.hasMatch(value.trim())) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? Function(String?) combine(
    List<String? Function(String?)> validators,
  ) {
    return (String? value) {
      for (final validate in validators) {
        final result = validate(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  static String? loginEmail(String? value) => combine([
        (v) => required(v, fieldName: 'Email'),
        email,
      ])(value);

  static String? loginPassword(String? value) => passwordNotEmpty(value);

  static String? registerName(String? value) => fullName(value);

  static String? registerEmail(String? value) => combine([
        (v) => required(v, fieldName: 'Email'),
        email,
      ])(value);

  static String? registerPassword(String? value) => passwordStrength(value);

  static String? Function(String?) registerConfirmPassword(
    String? passwordValue,
  ) =>
      confirms(passwordValue);
}
