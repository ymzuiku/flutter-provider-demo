import 'package:flutter/material.dart';
import 'package:learn_flutter/models/Models.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<Models>(
            builder: (c, m, _) {
              return Text('v-bind: ${m.user.name}');
            },
          ),
          _TextFieldName(),
          Consumer<Models>(
            builder: (c, m, _) {
              return TextField(
                onChanged: (v) {
                  m.user.setName(v);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TextFieldName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var models = Provider.of<Models>(context);

    return TextField(
      onChanged: (v) {
        models.user.setName(v);
      },
    );
  }
}
