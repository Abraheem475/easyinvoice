import 'package:flutter/material.dart';


class AddClientProvider extends ChangeNotifier {
  String? _name;
  String? _mobile;
  String? _phone;
  String? _email;
  String? _address;


  get name => _name;
  get mobile => _mobile;
  get phone => _phone;
  get email => _email;
  get address => _address;


  void clientAdd(clientMobile,clientPhone,clientName, clientEmail,clientAddress,) {
    _name =  clientName;
    _address = clientAddress;
    _mobile = clientMobile;
    _phone = clientPhone;
    _email = clientEmail;
    notifyListeners();
  }

  updateClient(clientName, clientEmail,clientPhone,clientAddress, clientMobile, ) {
    _name = clientName;
    _mobile = clientMobile;
    _phone = clientPhone;
    _email =  clientEmail;
    _address  = clientAddress;

    notifyListeners();
  }

  void clearData() {
    _name =  null;
    _address = null;
    _mobile = null;
    _email = null;
    _phone = null;
    notifyListeners();
  }
}

