import 'package:flutter/material.dart';
import 'package:giris_ekrani/src/mixins/validation_mixins.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidateMixin {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordFiled(),
            Container(
              margin: EdgeInsets.only(bottom: 25),
            ),
            submitFiled()
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email Adess", hintText: "email@example.com"),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordFiled() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: "Password", hintText: "******"),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitFiled() {
    return RaisedButton(
      color: Colors.amber,
      child: Text("Giriş"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print("Kullanıcı adı: $email   Şifre: $password");
        }
        formKey.currentState.reset();
      },
    );
  }
}
