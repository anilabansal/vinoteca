import 'package:intl/intl.dart';

bool validateEmail(email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool validateBirthDate(date) {
  var newDate = int.parse(date);
  return newDate < 1 || newDate > 30 ? true : false;
}

bool validateBirthMonth(month) {
  var newMonth = int.parse(month);
  return newMonth < 1 || newMonth > 12 ? true : false;
}

bool validateMobile(String value) {
  String pattern = r'(^([+]\d{2})?\d{8,12}$)';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    print("mobile not matches regrex");
    return true;
  } else {
    print("mobile  matches regrex");
    return false;
  }
}

String convertDate() {

  return DateFormat('yyyy-MM-dd').format(DateTime.now());
}

bool isTimePass24Hours(String lastLoginDate) {

  DateTime saveDateInDb = DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(lastLoginDate);
  //DateTime todayDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(todayDateTime);
  DateTime todayDate=  DateTime.now();
  //var diff=todayDate.difference(saveDateInDb);
  var diff=todayDate.difference(saveDateInDb);
  print("difference$diff");

  if(diff.inHours<24){
    return false;
  }else {
    return true;
  }


}
