import 'package:flutter/material.dart';
import 'package:learn_flutter/models/Models.dart';
import 'package:learn_flutter/screens/allScreens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => appModels,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: allScreens,
      ),
    );
  }
}
