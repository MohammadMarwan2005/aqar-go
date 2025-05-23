

extension ValidationHelper on String? {
  String? validateEmail() {
    if (this == null || this!.isEmpty) {
      return "Email cannot be empty";
    }
    final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegExp.hasMatch(this!)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? validateNotEmpty() {
    if (this == null || this!.isEmpty) {
      return "This field cannot be empty";
    }
    return null;
  }

  String? validatePassword() {
    if (this == null || this!.isEmpty) {
      return "Password cannot be empty";
    }
    if (!this!.hasUpperCase()) {
      return "Password must have at least one uppercase letter";
    }
    if (!this!.hasLowerCase()) {
      return "Password must have at least one lowercase letter";
    }
    if (!this!.hasSpecialCharacter()) {
      return "Password must have at least one special character";
    }
    if (!this!.hasNumber()) {
      return "Password must have at least one number";
    }
    if (this!.length < 8) {
      return "Password should be at least 8 characters";
    }
    return null;
  }
  String? validatePasswordConfirmations(String confirmation) {
    if (this != confirmation) {
      return "Passwords do not match";
    }
    return null;
  }
  String? validatePhoneNumber() {
    final phoneRegex = RegExp(r'^09\d{8}$');
    if (!phoneRegex.hasMatch(this ?? "")) {
      return "Invalid phone number";
    }
    return null;
  }

}


extension StringValidationHelper on String {
  bool hasLowerCase() {
    return contains(RegExp(r'[a-z]'));
  }

  bool hasUpperCase() {
    return contains(RegExp(r'[A-Z]'));
  }

  bool hasNumber() {
    return contains(RegExp(r'[0-9]'));
  }

  bool hasSpecialCharacter() {
    return contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  bool hasMinLength({int length = 8}) {
    return this.length >= length;
  }
}