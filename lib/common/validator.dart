class Validator {
  String? emptyValidator(value) {
    return value.toString().trim().isEmpty ? 'Field can\'t be empty' : null;
  }

  String? passwordValidator(value) {
    return value.toString().length < 6 ? 'Password can\'t be less than 6 characters' : null;
  }

  String? emailValidator(value) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    return !emailValid ? 'Email is not valid' : null;
  }

  String? phoneValidator(value) {
    bool phoneValid = RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$').hasMatch(value);
    return !phoneValid ? 'Phone number is not valid' : null;
  }
}