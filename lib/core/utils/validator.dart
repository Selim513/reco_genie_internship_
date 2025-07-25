abstract class Validate {
  static bool emailValidate(String email) {
    if (RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  static bool nameValidate(String name) {
    final nameRegex = RegExp(r"^[a-zA-Z\s]{2,50}$");
    return nameRegex.hasMatch(name.trim());
  }
}

String? checkEmailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter an email address';
  } else if (!Validate.emailValidate(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? checkNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter your name';
  } else if (!Validate.nameValidate(value)) {
    return 'Enter a valid name';
  }
  return null;
}

String? checkPasswordValidator(String? value, {bool isLogin = true}) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  } else if (value.length <= 7) {
    if (isLogin) {
      return 'Enter a valid Password';
    }
    return 'Password must be bigger than 7 letters and numbers';
  }
  return null;
}
