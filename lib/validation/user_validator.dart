class UserValidatorMixin {
  String validateUsername(String? value) {
    if (value!.isEmpty) {
      return "Name can't be empty";
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Only characters";
    } else if (value.length < 3) {
      return "Name should be more then 3 character";
    } else {
      return "";
    }
  }

  String validateLastName(String? value) {
    if (value!.isEmpty) {
      return "Surname can't be empty";
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Only characters";
    } else if (value.length < 3) {
      return "Name should be more then 3 character";
    } else {
      return "";
    }
  }

  String validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Name can't be empty";
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Only characters";
    } else if (value.length < 3) {
      return "Name should be more then 3 character";
    } else {
      return "";
    }
  }
}
