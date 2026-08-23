import '../../ui/index.dart';

class Validators {
  // Phone number
  static String? validatePhone(String value, {bool optional = false}) {
    if (optional == true) return null;
    if (value.isEmpty || value.trim().isEmpty) {
      return translate('validation.field_blank');
    } else if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
      return translate('validation.number_only');
    } else {
      return null;
    }
  }

  // Password
  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return translate('validation.enter_password');
    } else if (value.trim().isEmpty) {
      return translate('validation.field_blank');
    } else if (!RegExp(
            r'^(?=.{8,32}$)(?=.*[ -\/:-@\[-\`{-~]{1,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).*$')
        .hasMatch(value)) {
      return translate('validation.password_complex');
    } else if (value.length < 6) {
      return translate('validation.password_normal');
    } else {
      return null;
    }
  }

  // Confirmation code Form
  static String? validateConfCodeForm(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return translate('validation.field_blank');
    } else {
      return null;
    }
  }

  // Filed Mondetory Form
  static String? validateFieldForm(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return translate('validation.field_blank');
    } else {
      return null;
    }
  }

  // Email
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return translate('validation.email');
    } else if (value.trim().isEmpty) {
      return translate('validation.field_blank');
    } else if (RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$')
        .hasMatch(value.substring(0, value.indexOf('@')))) {
      return translate('validation.email_valid');
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return translate('validation.email_valid');
    } else {
      return null;
    }
  }
}
