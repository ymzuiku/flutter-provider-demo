import 'package:flutter/foundation.dart';
import 'package:learn_flutter/models/UserModel.dart';

class ChangeNotifierGroup extends ChangeNotifier {
  delegateNotifyListenners() {
    notifyListeners();
  }

  dynamic bindModel(model) {
    model.models = this;
    model.notifyListenners = this.notifyListeners;
    return model;
  }
}

class SubModel {
  Models models;
  Function notifyListenners;
}

class Models extends ChangeNotifierGroup {
  UserModel user;

  Models() {
    user = bindModel(UserModel());
  }
}

var appModels = Models();
