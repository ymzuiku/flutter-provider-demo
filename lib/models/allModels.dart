import 'package:provider/provider.dart';
import 'package:learn_flutter/models/CarModel.dart';

var allModels = [
  ChangeNotifierProvider(builder: (context) => CartModel()),
];
