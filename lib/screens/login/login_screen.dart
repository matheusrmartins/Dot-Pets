import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo/blocks/login/field_state.dart';
import 'package:xlo/blocks/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Entrar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding (
                padding: const EdgeInsets.only(top: 20, bottom: 11),
                child: Text (
                  'Acessar com E-mail',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                ),
              ),
        Padding (
          padding: const EdgeInsets.only(top: 3, bottom: 4),
          child: Text (
            'E-mail',
            style: TextStyle(fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w700),
          ),
        ),
              StreamBuilder<FieldState>(
                stream: _loginBloc.outEmail,
                initialData: FieldState(),
                builder: (context, snapshot){
                  return TextField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorText: snapshot.data.error
                    ),
                    onChanged: _loginBloc.changeEmail,
                    enabled: snapshot.data.enabled,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, bottom: 4, top: 26),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text (
                        'Senha',
                        style: TextStyle(fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w700),
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Esqueci a senha',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              StreamBuilder<FieldState>(
                stream: _loginBloc.outPassword,
                initialData: FieldState(),
                builder: (context, snapshot){
                  return TextField(
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                      errorText: snapshot.data.error
                    ),
                    onChanged: _loginBloc.changePassword,
                    enabled: snapshot.data.enabled,
                  );
                },
              ),
            ],
          ),
        ),

      ),
    );
  }
}
