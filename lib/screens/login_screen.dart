import 'package:flutter/material.dart';
import 'package:instegram/screens/signup_screen.dart';
import 'package:instegram/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static final String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _fromKey = GlobalKey<FormState>();
  String _email, _password;

  _submmit() {
    if (_fromKey.currentState.validate()) {
      _fromKey.currentState.save();
      AuthService.login(_email, _password);
      //Login the user

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Instegram',
                style: TextStyle(fontFamily: "Billabong", fontSize: 50.0),
              ),
              Form(
                key: _fromKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Email"),
                        validator: (input) => !input.contains('@')
                            ? 'please enter valid email'
                            : null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Password"),
                        validator: (input) => input.length < 6
                            ? 'must be at least 6 characters'
                            : null,
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 250.0,
                      child: FlatButton(
                          onPressed: _submmit,
                          color: Colors.blue,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Login',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          )),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 250.0,
                      child: FlatButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, SignupScreen.id),
                          color: Colors.blue,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'SignUp Now!',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
