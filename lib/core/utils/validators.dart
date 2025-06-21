import 'package:email_validator/email_validator.dart';
import 'package:kafa2a/core/messages.dart';

class Validators {
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return Messages.emailRequired;
    }
    if (!EmailValidator.validate(email)) {
      return Messages.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return Messages.passwordRequired;
    } else if (password.length < 6) {
      return Messages.passwordIsSmall;
    }
    return null;
  }

  static String? validateConfirmationPasswords(
      String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return Messages.passwordsDontMatch;
    }
    return null;
  }

  static String? validateNull(String? text, String message) {
    if (text == null || text.trim().isEmpty) {
      return message;
    }
    return null;
  }
}
