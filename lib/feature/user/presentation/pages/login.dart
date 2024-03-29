import 'package:actividad1c2/feature/user/presentation/pages/register.dart';
import 'package:actividad1c2/feature/user/presentation/pages/restore_pasword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocks/login/login_bloc.dart';


class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    TextFormField emailField = TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        contentPadding: EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      textAlign: TextAlign.center,
    );

    TextFormField passwordField = TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        contentPadding: EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignLabelWithHint: true,
      ),
      textAlign: TextAlign.center,
    );

    ElevatedButton loginButton = ElevatedButton(
      onPressed: () {
        String email = emailController.text;
        String password = passwordController.text;

        BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
          email: email,
          password: password,
        ));
      },
      child: Container(
        width: 310,
        height: 40,
        margin: EdgeInsets.only(top: 2, left: 4),
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );

    ElevatedButton registerButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Register()), // Reemplaza 'HomePage' con el nombre de tu página destino
        );
      },
      child: Container(
        width: 310,
        height: 40,
        margin: EdgeInsets.only(top: 2, left: 4),
        child: Center(
          child: Text(
            'Register',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login in')),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 60,
                  left: 137,
                  child: Opacity(
                    opacity: 0.4,
                    child: Image(
                      width: 114,
                      height: 115,
                      image: AssetImage('assets/spafill0wght400grad0opsz24-1-GuG.png'),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    loginButton,
                    SizedBox(height: 10),
                    registerButton,
                    SizedBox(height: 20),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}