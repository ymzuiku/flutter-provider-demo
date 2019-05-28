import 'package:learn_flutter/screens/Login.dart';
import 'package:learn_flutter/screens/Catalog.dart';
import 'package:learn_flutter/screens/Cart.dart';

var allRouters = {
  '/': (context) => Login(),
  '/catalog': (context) => Catalog(),
  '/cart': (context) => Cart(),
};
