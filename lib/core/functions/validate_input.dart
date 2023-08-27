import 'package:get/get.dart';

String? validateInput(String val, int min, int max, String type) {
  if (val == "") {
    return "*this field is required".tr;
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "invalid username".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "invalid email".tr;
    }
  }
  if (type == "phoneNumber") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "invalid phone number".tr;
    }
  }
  if (val.length < min) {
    return "${"the field length should be".tr} $min ${"or more".tr}";
  }
  if (val.length > max) {
    return "${"the field length should be".tr} $max ${"or less".tr}";

  }

  return null;
}
