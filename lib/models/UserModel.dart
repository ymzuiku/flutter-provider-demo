import 'package:learn_flutter/models/Models.dart';

class UserModel extends SubModel {
  String name = '';
  String password = '';

  void setName(String name) {
    this.name = name;
    notifyListenners();
  }
}
