import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ValueGetProvider with ChangeNotifier{
  var _businessName;
  var _businessEmail;
  var _businessAddress;
  var _contactNumber;

  get businessName => _businessName;
  get businessEmail => _businessEmail;
  get businessAddress => _businessAddress;
  get contactNumber => _contactNumber;

  void allClearData() {
    _businessName = "";
    _businessEmail = "";
    _businessAddress = "";
    _contactNumber = "";
    notifyListeners();
  }
  void updateTextData(
      String? name, String? number, String? email, String? address) {
    _businessName = name;
    _contactNumber = number;
    _businessEmail = email;
    _businessAddress = address;
    notifyListeners();
  }


}