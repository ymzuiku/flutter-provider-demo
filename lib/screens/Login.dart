import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.display4,
              ),
              SizedBox(height: 24),
              _LoginTextField(hintText: 'Login'),
              SizedBox(height: 12),
              _LoginTextField(
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 24),
              FlatButton(
                color: Colors.yellow,
                child: Text('enter'),
                onPressed: () => Navigator.pushNamed(context, '/catalog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  _LoginTextField({
    Key key,
    @required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.black12,
      ),
      obscureText: obscureText,
    );
  }
}
