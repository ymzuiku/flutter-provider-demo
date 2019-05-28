import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:learn_flutter/screens/allRouters.dart';
import 'package:learn_flutter/models/allModels.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allModels,
      child: MaterialApp(
        initialRoute: '/',
        routes: allRouters,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: TextTheme(
            display4: TextStyle(
              fontFamily: 'Corben',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
